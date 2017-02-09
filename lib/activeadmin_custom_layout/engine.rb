require "activeadmin_custom_layout/helpers"

# Export layout items as content_for elements
require "activeadmin_custom_layout/layout/pages/base"
require "activeadmin_custom_layout/layout/pages/index"
require "activeadmin_custom_layout/layout/header"
require "activeadmin_custom_layout/layout/title_bar"
require "activeadmin_custom_layout/layout/components/scopes"
require "activeadmin_custom_layout/layout/components/site_title"
require "activeadmin_custom_layout/layout/components/index_list"
require "activeadmin_custom_layout/layout/components/table_for"
require "activeadmin_custom_layout/layout/components/batch_action_selector"

module ActiveadminCustomLayout
  class Engine < ::Rails::Engine
    isolate_namespace ActiveadminCustomLayout
  end
end
