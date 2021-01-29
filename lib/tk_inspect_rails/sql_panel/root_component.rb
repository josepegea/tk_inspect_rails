module TkInspectRails
  module SqlPanel
    class RootComponent < TkComponent::Base
      attr_accessor :sql_panel
      attr_accessor :expression
      attr_accessor :results

      def render(p, parent_component)
        p.vpaned(sticky: 'wens', x_flex: 1, y_flex: 1) do |f|
          f.vframe(sticky: 'wens', x_flex: 1) do |vf|
            vf.hframe(sticky: 'wen', padding: 8, x_flex: 1) do |hf|
              hf.label(text: "SQL Expression", sticky: 'w', x_flex: 1)
              hf.button(text: "Execute", sticky: 'e', on_click: :execute_sql)
            end
            @text = vf.text(value: @expression.to_s, width: 20, height: 5, scrollers: 'y',
                            x_flex: 1, y_flex: 1, sticky: 'news')
          end
          f.insert_component(TkComponent::TableViewComponent, self,
                             data_source: self,
                             columns: @results&.first&.keys&.map { |k| { key: k, text: k } } || [],
                             scrollers: 'xy',
                             sticky: 'nsew', x_flex: 1, y_flex: 1)
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

