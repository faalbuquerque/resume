Rails.application.routes.draw do
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
  resources :dashboard, only: %i[index]
  resources :personal_infos
  resources :academic_infos
  resources :courses
  resources :experiences
  resources :skills
end
