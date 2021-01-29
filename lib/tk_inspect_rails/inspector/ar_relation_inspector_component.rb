module TkInspect
  module Inspector
    class ArRelationInspectorComponent < ::TkComponent::Base
      attr_accessor :inspector

      def render(p, parent_component)
        @relation = eval(inspector.expression, inspector.inspected_binding)
        @count = @relation.size if @relation.loaded?
        p.vframe(sticky: 'nsew', x_flex: 1, y_flex: 1) do |f|
          f.hframe(sticky: 'wne', padding: '8', x_flex: 1) do |hf|
            hf.label(text: "Relation Class")
            hf.entry(value: @relation.class.to_s, state: 'disabled', x_flex: 1)
            hf.button(text: "Browse...", on_click: ->(e) { inspector.browse_class(@relation.class.to_s) })
            hf.label(text: "Model Class")
            hf.entry(value: @relation.klass.to_s, state: 'disabled', x_flex: 1)
            hf.button(text: "Browse...", on_click: ->(e) { inspector.browse_class(@relation.klass.to_s) })
            hf.label(text: "Table")
            hf.entry(value: @relation.table.name, state: 'disabled', x_flex: 1)
          end
          f.vframe(sticky: 'wne', padding: '8', x_flex: 1) do |vf|
            vf.label(text: "SQL expression", sticky: 'w')
            vf.text(value: @relation.to_sql, width: 20, height: 3, x_flex: 1, sticky: 'new')
          end
          if @count.present?
            f.hframe(sticky: 'w', padding: '8', x_flex: 1) do |hf|
              hf.label(text: "Object count")
              hf.entry(value: @count, state: 'disabled')
            end
          end
          f.hframe(sticky: 'sw', padding: '8', x_flex: 1) do |hf|
            if @relation.loaded?
              @table = f.insert_component(
                TkComponent::TableViewComponent,
                self,
                data_source: self,
                columns: @relation.first.attributes.map do |k, v|
                  { key: k, text: k }
                end,
                sticky: 'nsew', x_flex: 1, y_flex: 1)
            else
              hf.label(text: "Contents not loaded")
              hf.button(text: "Load contents") do |b|
                b.on_click ->(e) { @relation.load; regenerate }
              end
              if @count.blank?
                hf.button(text: "Get object count") do |b|
                  b.on_click ->(e) { @count = @relation.count; regenerate }
                end
              end
            end
          end
        end
      end

      def items_for_path(path = [])
        @relation.records.map(&:attributes)
      end
    end
  end
end
