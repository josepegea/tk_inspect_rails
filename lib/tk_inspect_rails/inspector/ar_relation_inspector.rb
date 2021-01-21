module TkInspect
  module Inspector
    class ArRelationInspector < Controller
      register_shared_inspector self, ::ActiveRecord::Relation

      def create_main_component
        @main_component = ArRelationInspectorComponent.new
      end

      def window_title
        "Active Record Relation Inspector"
      end
    end
  end
end
