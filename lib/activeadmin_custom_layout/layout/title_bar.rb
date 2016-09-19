module TitleBarPatch

  def build_titlebar_right
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

end

module ActiveAdmin
  module Views
    class TitleBar
      prepend TitleBarPatch
    end
  end
end
