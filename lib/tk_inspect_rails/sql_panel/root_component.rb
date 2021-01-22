module TkInspectRails
  module SqlPanel
    class RootComponent < TkComponent::Base
      attr_accessor :sql_panel
      attr_accessor :expression
      attr_accessor :results

      def generate(parent_component, options = {})
        parse_component(parent_component, options) do |p|
          p.vpaned(sticky: 'wens', h_weight: 1, v_weight: 1) do |f|
            f.vframe(sticky: 'wens', h_weight: 1) do |vf|
              vf.hframe(sticky: 'wen', padding: 8, h_weight: 1) do |hf|
                hf.label(text: "SQL Expression", sticky: 'w', h_weight: 1)
                hf.button(text: "Execute", sticky: 'e', on_click: :execute_sql)
              end
              @text = vf.text(value: @expression.to_s, width: 20, height: 5, scrollers: 'y',
                              h_weight: 1, v_weight: 1, sticky: 'news')
            end
            f.insert_component(TkComponent::TableViewComponent, self,
                               data_source: self,
                               columns: @results&.first&.keys&.map { |k| { key: k, text: k } } || [],
                               scrollers: 'xy',
                               sticky: 'nsew', h_weight: 1, v_weight: 1)
          end
        end
      end

      def items_for_path(path)
        @results || []
      end

      def execute_sql(e)
        @expression = @text.value
        @results = @sql_panel.execute_sql(@expression)
        regenerate
      end
    end
  end
end

