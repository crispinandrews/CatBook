  Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "posts#index"

  resources :posts, shallow: true do
      resources :comments do
        resources :comment_likes
        resources :comment_hisses
      end
      resources :likes
      resources :hisses
  end
  resources :relationships
  get ':petname', to: 'profiles#show', as: :profile
  # get ':petname/edit', to: 'profiles#edit', as: :edit_profile
  # patch ':petname/edit', to: "profiles#update", as: :update_profile
end
