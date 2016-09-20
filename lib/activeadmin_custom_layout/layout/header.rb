module HeaderPatch
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
end

module ActiveAdmin
  module Views
    class Header
      prepend HeaderPatch
    end
  end
end
