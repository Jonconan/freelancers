Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'

  resources :users do
    post 'confirm', on: :collection
    get  'confirm', on: :collection

    # テスト用
    get 'check', on: :collection
  end

  get  'sign_in'  => 'user_sessions#sign_in', as: 'sign_in'
  post 'sign_in'  => 'user_sessions#new_session'
  get  'sign_out' => 'user_sessions#sign_out', as: 'sign_out'
end
