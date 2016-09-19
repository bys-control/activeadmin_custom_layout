module HeaderPatch
  def build_site_title
    context = Arbre::Context.new

    within context do
      super
    end

    content_for :site_title do
      context.content
    end

    text_node context
  end

  def build_global_navigation
    context = Arbre::Context.new

    within context do
      super
    end

    content_for :global_navigation do
      context.content
    end

    text_node context
  end

  def build_utility_navigation
    context = Arbre::Context.new

    within context do
      super
    end

    content_for :utility_navigation do
      context.content
    end

    text_node context
  end
end

module ActiveAdmin
  module Views
    class Header
      prepend HeaderPatch
    end
  end
end
