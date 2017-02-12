require 'rails/generators/active_record'

module ActiveadminCustomLayout
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Configures ActiveAdmin to use custom layout in your app"

      source_root File.expand_path('../', __FILE__)
      ASSET_BASE_PATH = 'app/assets'
      JS_BASE_PATH    = "#{ASSET_BASE_PATH}/javascripts"
      CSS_BASE_PATH   = "#{ASSET_BASE_PATH}/stylesheets"

      def add_javascripts
        if File.exist?("#{JS_BASE_PATH}/active_admin.js")
          append_file "#{JS_BASE_PATH}/active_admin.js", "\n//= require activeadmin_custom_layout\n"
        elsif File.exist?("#{JS_BASE_PATH}/active_admin.js.coffee")
          append_file "#{JS_BASE_PATH}/active_admin.js.coffee", "\n#= require activeadmin_custom_layout\n"
        end
      end

      def add_stylesheets
        if File.exist?("#{CSS_BASE_PATH}/active_admin.css")
          append_file "#{CSS_BASE_PATH}/active_admin.css", "\n//= require activeadmin_custom_layout\n"
        elsif File.exist?("#{CSS_BASE_PATH}/active_admin.css.scss")
          append_file "#{CSS_BASE_PATH}/active_admin.css.scss", "\n//= require activeadmin_custom_layout\n"
        elsif File.exist?("#{CSS_BASE_PATH}/active_admin.scss")
          append_file "#{CSS_BASE_PATH}/active_admin.scss", "\n//= require activeadmin_custom_layout\n"
        end
      end

      def copy_files
        copy_file "./files/custom_base_controller.rb", "app/admin/custom_base_controller.rb"
      end

    end
  end
end
