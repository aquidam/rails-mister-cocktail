Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  get 'doses/new'
  resources :cocktails, except: [:edit, :update, :destroy] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end

  # get 'cocktails', to: 'cocktails#index', as: 'cocktails'
  # get 'cocktails/new', to: 'cocktails#new', as: 'new_cocktail'
  # get 'cocktails/:id', to: 'cocktails#show', as: 'cocktail'
  # post 'cocktails', to: 'cocktails#create'
  # get 'cocktails/:cocktail_id/doses', to: 'doses#show', as: 'cocktail_doses'
  # get 'cocktails/:cocktail_id/doses/new', to: 'doses#new', as: 'new_cocktail_dose'
  # post 'cocktails/:cocktail_id/doses', to: 'doses#create'
  # delete 'doses/:id', to: 'doses#destroy', as: 'cocktail_dose_destroy'
