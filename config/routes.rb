Rails.application.routes.draw do
  get 'trees/index'
  get 'trees/new'
  get 'trees/show'
  get 'trees/edit'
  get 'printers/index'
  get 'printers/show'
  get 'printers/new'
  get 'cartriges/index'
  get 'cartriges/show'
  get 'cartriges/new'
  get 'main/index'

  resources :cartriges, :printers 

  root 'main#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
