<% provide(:title, "Manage Practice Qs") %>
<h1>Manage Practice Qs</h1>
<%= form_for(@question) do |f| %>
  <%= render 'shared/error_messages', object: @user %>

  <%= f.label :name %>
  <%= f.text_field :name, class: 'form-control' %>

  <%= f.label :content %>
  <%= f.text_field :content, class: 'form-control' %>

  <%= f.submit "Add", class: "btn btn-primary" %>
<% end %>

Rails.application.routes.draw do

  get 'questions/new'

  root   'static_pages#home'
  get    '/help',          to: 'static_pages#help'
  get    '/about',         to: 'static_pages#about'
  get    '/contact',       to: 'static_pages#contact'
  get    '/signup',        to: 'users#new'
  get    '/login',         to: 'sessions#new'
  get    '/tests',         to: 'tests#new'
  get    '/subjects',      to: 'tests#subjects'
  get    '/sat',           to: 'test_pages#sat'
  get    '/act',           to: 'test_pages#act'
  get    '/psat',          to: 'test_pages#psat'
  get    '/biology',       to: 'test_pages#act'
  get    '/us_history',    to: 'test_pages#us_history'
  get    '/new_questions', to: 'questions#new'
  post   '/add_question',  to: 'questions#create'
  post   '/login',         to: 'sessions#create'
  delete '/logout',        to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :questions,           only: [:new, :destroy]
end
