Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'csv_uploads#index'

  resource :csv_uploads, only: [:index] do
  	collection do
  		post :upload
  	end
  end
end
