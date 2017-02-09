module ActiveAdmin
  module ViewHelpers
    module ActiveAdminApplicationHelper
      attr_accessor :aa_data

      def arbre_content_for( name, &block )
        if block_given?
          content_for name.to_sym do
            Arbre::Context.new do
              text_node yield
            end.content
          end
        end
      end

      #
      # Injects ActiveAdmin data into the WEB page as a javaScript object
      #
      #
      # @return [string]
      # 
      def active_admin_data_tag
        "<script type=\"text/javascript\">window.active_admin_data = #{aa_data.to_json}</script>".html_safe
      end

      def controlller_stylesheet_link_tag
        stylesheet_link_tag params[:controller] if asset_exist?("#{params[:controller]}.css")
      end

      def controller_env_stylesheet_link_tag
        stylesheet_link_tag "#{params[:controller]}-#{Rails.env}" if asset_exist?("#{params[:controller]}-#{Rails.env}.css")
      end

      def controller_javascript_include_tag
        javascript_include_tag params[:controller] if asset_exist?("#{params[:controller]}.js")
      end

      def controller_env_javascript_include_tag
        javascript_include_tag "#{params[:controller]}-#{Rails.env}" if asset_exist?("#{params[:controller]}-#{Rails.env}.js")
      end
    end
  end
end
