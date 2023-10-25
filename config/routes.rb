Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/top' => 'homes#top'
  get 'books/new'
  get 'books' => 'books#index'
  post 'books' => 'books#create'
  get 'books' => 'books#edit'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  get 'books', to: 'books#index', as: :another_page
  get 'books/:id' => 'books#show', as: 'book'
  patch 'books/:id' => 'books#update', as: 'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  get 'books/:id/show' => 'books#show', as: 'show_book'
  resources :books
  
 end
