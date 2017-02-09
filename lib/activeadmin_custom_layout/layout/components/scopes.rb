module ScopesPatch

  protected

  def build_scope(scope, options)
    aa_data[:scopes] ||= []
    li class: classes_for_scope(scope) do
      scope_name = I18n.t "active_admin.scopes.#{scope.id}", default: scope.name
      params     = request.query_parameters.except :page, :scope, :commit, :format
      count      = nil
      url        = url_for(scope: scope.id, params: params)
      if options[:scope_count] && scope.show_count
        count = get_scope_count(scope)
      end

      a href: url, class: 'table_tools_button' do
        text_node scope_name
        span class: 'count' do
          "(#{count})"
        end if options[:scope_count] && scope.show_count
      end

      aa_data[:scopes].push({
        name: scope_name,
        url: url,
        count: count,
        current: current_scope?(scope)
      })
    end
  end

end

module ActiveAdmin
  module Views
    class Scopes
      prepend ScopesPatch
    end
  end
end
