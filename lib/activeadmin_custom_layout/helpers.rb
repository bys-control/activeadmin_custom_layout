module ActiveAdmin
  module ViewHelpers
    module ActiveAdminApplicationHelper

      def arbre_content_for( name, &block )
        if block_given?
          context = Arbre::Context.new do
            text_node yield
          end

          content_for name.to_sym do
            context.content
          end

          context.content
        end
      end

    end
  end
end
