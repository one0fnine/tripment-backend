Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'api/v1/procedures#index'

  namespace 'api' do
    namespace 'v1' do
      resources :procedures, only: :index do
        put :reload, on: :collection
      end
    end
  end
end
