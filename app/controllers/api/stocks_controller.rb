module Api
  class StocksController < ApplicationController
    def stock_deposit
      stocks = Stock.with_stock_type(:deposit)
      render json: stocks.as_json
    end

    def stock_withdraw
      stocks = Stock.with_stock_type(:withdraw)
      render json: stocks.as_json
    end
  end
end
