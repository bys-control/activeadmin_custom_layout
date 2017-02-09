module IndexListPatch

  protected

  def build_index_list(index_class)
    aa_data[:index_list] ||= []
    url = url_for(as: index_class.index_name.to_sym)
    name = index_class.index_name
    i18n_name = I18n.t("active_admin.index_list.#{name}", default: name.to_s.titleize)

    li class: classes_for_index(index_class) do
      a href: url, class: "table_tools_button" do
        i18n_name
      end
    end

    aa_data[:index_list] << {
      name: name,
      i18n_name: i18n_name,
      url: url,
      current: current_index?(index_class)
    }
  end

end

module ActiveAdmin
  module Views
    class IndexList
      prepend IndexListPatch
    end
  end
end