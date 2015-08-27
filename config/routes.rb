Rails.application.routes.draw do
  root to: 'visitors#index'

  resources :massages  do
    collection do
      get 'get_data'
    end
  end

  resources :naturopaths do
    collection do
      get 'get_data'
    end
  end

    resources :acupunctures do
    collection do
      get 'get_data'
    end
  end
end
