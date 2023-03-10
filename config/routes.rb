Rails.application.routes.draw do
  get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#home'
  get 'static_employee/:employe_id', to: 'demandes#static_employee'
  get :static_admin, to: 'demandes#static_admin'
  get :'demandeid/:employe_id', to: 'demandes#demandeid'
  patch '/updateadminimage/:id', to: 'demandes#updateadminimage'
  patch '/updatedemandebymotif/:id', to: 'demandes#updatedemandebymotif'
  resources :users
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  resources :motif, only: %i[index show create update destroy ]
  resources :demandes, only: %i[index show create update destroy ]
  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
  resources :registrations do
    member do
      get :confirm_email
    end
  end
end
