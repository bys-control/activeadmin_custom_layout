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
