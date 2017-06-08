module BasePatch

  def build
    self.aa_data = {
      action: params[:action],
      controller: params[:controller].tr('/', '_'),
      url: request.path
    }
    super
    content_for :body_classes do
      @body.class_names
    end

    content_for :body_attributes do
      raw(@body.attributes)
    end
  end

  def build_active_admin_head
    within @head do
      arbre_content_for :title do
        insert_tag Arbre::HTML::Title, [title, render_or_call_method_or_proc_on(self, active_admin_namespace.site_title)].compact.join(" | ")
      end

      active_admin_application.stylesheets.each do |style, options|
        arbre_content_for :stylesheets do
          text_node stylesheet_link_tag(style, options).html_safe
        end
      end

      active_admin_application.javascripts.each do |path|
        arbre_content_for :javascripts do
          text_node(javascript_include_tag(path))
        end
      end

      if active_admin_namespace.favicon
        arbre_content_for :favicon do
          text_node(favicon_link_tag(active_admin_namespace.favicon))
        end
      end

      active_admin_namespace.meta_tags.each do |name, content|
        arbre_content_for :meta_tags do
          text_node(tag(:meta, name: name, content: content))
        end
      end

      text_node csrf_meta_tag
    end
  end

  def build_unsupported_browser
    arbre_content_for :unsupported_browser do
      super
    end
  end

  def build_title_bar
    arbre_content_for :title_bar do
      super
    end
  end

  def build_flash_messages
    arbre_content_for :flash_messages do
      super
    end
  end

  def build_main_content_wrapper
    arbre_content_for :main_content do
      super
    end
  end

  def build_sidebar
    arbre_content_for :sidebar do
      super
    end
  end

  def build_footer
    arbre_content_for :footer do
      super
    end
  end

end

module ActiveAdmin
  module Views
    module Pages
      class Base
        prepend BasePatch
      end
    end
  end
end
