module IndexPatch
  def build_table_tools
    arbre_content_for :index_table_tools do
      super
    end
  end

  def build_batch_actions_selector
    arbre_content_for :index_batch_actions do
      super
    end
  end

  def build_scopes
    arbre_content_for :index_scopes do
      super
    end
  end

  def build_index_list
    arbre_content_for :index_index_list do
      super
    end
  end

  def build_collection
    arbre_content_for :index_collection do
      super
    end
  end

  def render_index
    renderer_class = find_index_renderer_class(config[:as])
    entry_name       = active_admin_config.resource_label
    entries_name     = active_admin_config.plural_resource_label(count: collection_size)
    paginator        = config.fetch(:paginator, true)
    download_links   = config.fetch(:download_links, active_admin_config.namespace.download_links)
    pagination_total = config.fetch(:pagination_total, true)
    per_page         = config.fetch(:per_page, active_admin_config.per_page)

    aa_data[:table] = {
      entry_name: entry_name,
      entries_name: entries_name,
      download_links: download_links,
      paginator: paginator,
      per_page: per_page,
      pagination_total: pagination_total
    }

    paginated_collection(collection, entry_name:       entry_name,
                                     entries_name:     entries_name,
                                     download_links:   download_links,
                                     paginator:        paginator,
                                     per_page:         per_page,
                                     pagination_total: pagination_total) do
      div class: 'index_content' do
        insert_tag(renderer_class, config, collection)
      end
    end
  end

end

module ActiveAdmin
  module Views
    module Pages
      class Index
        prepend IndexPatch
      end
    end
  end
end
