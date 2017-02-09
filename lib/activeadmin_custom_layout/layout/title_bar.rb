module TitleBarPatch
  def build(*args)
    super
    self.aa_data[:action_items] = export_aa_data_actions
    self.aa_data[:breadcrumbs] = export_aa_data_breadcrumbs
  end

  def build_titlebar_right
    arbre_content_for :titlebar_right do
      super
    end
  end

  def build_action_items
    arbre_content_for :action_items do
      super
    end
  end

  def build_breadcrumb(separator = "/")
    arbre_content_for :breadcrumb do
      super
    end
  end

  def build_title_tag
    arbre_content_for :title_tag do
      super
    end
  end

  def export_aa_data_actions
    action_data = []

    @action_items.each do |action_item|
      action_data.push({
        name: action_item.name,
        action: instance_exec(&action_item.block)
      })
    end

    action_data
  end

  def export_aa_data_breadcrumbs
    breadcrumb_data = []
    breadcrumb_config = active_admin_config && active_admin_config.breadcrumb

    links = if breadcrumb_config.is_a?(Proc)
      instance_exec(controller, &active_admin_config.breadcrumb)
    elsif breadcrumb_config.present?
      breadcrumb_links
    end
    if links.present? && links.is_a?(::Array)
      links.each do |url|
        breadcrumb_data.push({
          url: "#{url}"
        })
      end      
    end
    breadcrumb_data
  end

end

module ActiveAdmin
  module Views
    class TitleBar
      prepend TitleBarPatch
    end
  end
end
