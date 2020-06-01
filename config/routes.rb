Rails.application.routes.draw do
  root 'home#top'
  get 'home/about', to: "home#about"
  devise_for :users, controllers: {
  sessions: 'devise/sessions',
  registrations: 'devise/registrations'
}
  resources :users
  resources :books

end