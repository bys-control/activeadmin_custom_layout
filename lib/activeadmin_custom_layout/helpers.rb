module ActiveAdmin
  module ViewHelpers
    module ActiveAdminApplicationHelper

      def arbre_content_for( name, &block )
        if block_given?
          content_for name.to_sym do
            Arbre::Context.new do
              text_node yield
            end.content
          end
        end
      end

    end
  end
end
