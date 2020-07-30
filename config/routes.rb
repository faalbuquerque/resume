Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
  resources :dashboard, only: %i[index]
  resources :personal_infos, only: %i[index new create show
                                      edit update destroy]
  resources :academic_infos, only: %i[index new create show
                                      edit update destroy]
end
