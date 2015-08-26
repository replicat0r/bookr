Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :massages ,only: [:new, :create,:edit,:update,:index] do
    collection do
      get 'get_data'
    end
  end
end
