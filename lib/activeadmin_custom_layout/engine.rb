require "activeadmin_custom_layout/helpers"

# Export layout items as content_for elements
require "activeadmin_custom_layout/layout/base"
require "activeadmin_custom_layout/layout/header"
require "activeadmin_custom_layout/layout/index"
require "activeadmin_custom_layout/layout/title_bar"

module ActiveadminCustomLayout
  class Engine < ::Rails::Engine
    isolate_namespace ActiveadminCustomLayout
  end
end
