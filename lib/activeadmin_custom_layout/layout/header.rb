module HeaderPatch
  def build(*args)
    super
    self.aa_data[:global_navigation] = export_aa_data_menu @menu.items(self)
    self.aa_data[:utility_navigation] = export_aa_data_menu @utility_menu.items(self)
  end

  def build_site_title
    arbre_content_for :site_title do
      super
    end
  end

  def build_global_navigation
    arbre_content_for :global_navigation do
      super
    end
  end

  def build_utility_navigation
    arbre_content_for :utility_navigation do
      super
    end
  end

  #
  # Exports menu data as a hash
  #
  #
  # @return [Hash] Hash containing current menu information
  # 
  def export_aa_data_menu menu_items
    menu_data = []
    if menu_items.presence
      menu_items.each do |item|
        menu_data.push({
          id: item.id,
          current: item.current?(assigns[:current_tab]),
          url: item.url(self),
          label: item.label(self),
          html_options: item.html_options,
          children: export_aa_data_menu(item.items(self))
        })
      end
    end
    menu_data
  end
end

module ActiveAdmin
  module Views
    class Header
      prepend HeaderPatch
    end
  end
end
