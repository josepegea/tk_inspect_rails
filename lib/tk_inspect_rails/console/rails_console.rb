module TkInspect
  module Console
    module RailsConsole
      # Loads the Rails console into the current TkConsole
      # Inspired by https://github.com/cldwalker/ripl-rails/blob/master/lib/ripl/rails.rb
      def rails_console
        say 'Loading Rails console...'
        require "#{Dir.pwd}/config/boot"
        if File.exists?("#{Dir.pwd}/config/application.rb")
          Object.const_set :APP_PATH, File.expand_path("#{Dir.pwd}/config/application")
          require APP_PATH
          require 'rails/console/app'
          require 'rails/console/helpers'
          if defined?(Rails::ConsoleMethods)
            self.class.include Rails::ConsoleMethods
          end
          ::Rails.application.require_environment!
        else
          ["#{Dir.pwd}/config/environment", 'console_app', 'console_with_helpers'].each {|e| require e }
        end
        say 'Rails console loaded!'
      end
    end
  end
end
