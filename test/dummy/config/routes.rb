Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount ActiveadminCustomLayout::Engine => "/activeadmin_custom_layout"
end
