module BaseControllerPatch
  def determine_active_admin_layout
    'activeadmin_custom_layout/application'
  end
end

module ActiveAdmin
  class BaseController
    prepend BaseControllerPatch
  end
end
