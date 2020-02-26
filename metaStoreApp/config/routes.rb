Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :accounts
      resources :medias
      resources :metadatas

      get '/showmedia/:id', to: 'accounts#showmedia'
      #get '/addcsv/:fileid',to: 'metadatas#addcsv'
    end
  end
end
