Rails.application.routes.draw do
  devise_for :users
  root 'show_info#index'
  get 'show_info/index'

  get 'show_info/atualizar_lista_de_repositorios' => 'show_info#atualizar_lista_de_repositorios', :as => :atualiza_lista

end
