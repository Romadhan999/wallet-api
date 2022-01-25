Rails.application.routes.draw do
  namespace :api do
    get '/users/:username', to: 'users#user_detail'
    get '/users/:username/account', to: 'users#account_detail'
    get '/users/:username/transactions', to: 'users#transaction_histories'
    post '/deposit', to: 'transactions#deposit'
    post '/withdraw', to: 'transactions#withdraw'
    post '/transfer', to: 'transactions#transfer'
    get '/stock_deposit', to: 'stocks#stock_deposit'
    get '/stock_withdraw', to: 'stocks#stock_withdraw'
  end
end
