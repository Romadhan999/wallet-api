module Api
  class UsersController < ApplicationController
    def user_detail
      user = User.find_by(username: params[:username])
      render json: user.as_json(include: :account)
    end

    def account_detail
      user = User.find_by(username: params[:username])
      render json: user.account.as_json
    end

    def transaction_histories
      user = User.find_by(username: params[:username])
      render json: user.account.transactions.order(created_at: :desc).as_json(include: :fund)
    end
  end
end
