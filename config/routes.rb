Rails.application.routes.draw do
  devise_for :users
  root 'show_info#index'
  get 'show_info/index'


end
