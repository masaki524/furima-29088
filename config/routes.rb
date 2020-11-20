Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/sign_up', to: 'devise/registrations#new'
  get '', to:'items#index'
end
