module TkInspectRails
  module SqlPanel
    class Base
      attr_accessor :tk_root
      attr_accessor :main_component

      def initialize
        @tk_root = nil
        @main_component = nil
      end

      def refresh
        @main_component.nil? ? create_root : @main_component.regenerate
      end

      def create_root
        @tk_root = TkComponent::Window.new(title: "SQL Panel")
        @main_component = RootComponent.new
        @main_component.sql_panel = self
        @tk_root.place_root_component(@main_component)
        create_menu
      end

      def execute_sql(expression)
        ActiveRecord::Base.connection.execute(expression)
      end

      # So far, we only register key accelerators. Menus are better inherited from main console
      def create_menu
        @tk_root.tk_item.native_item.bind('Command-r', -> { main_component.execute_sql(nil) })
      end
    end
  end
end
