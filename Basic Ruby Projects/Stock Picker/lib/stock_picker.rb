# frozen_string_literal: true

def stock_picker(stock_prices)
  min_stock = stock_prices.first
  min_stock_idx = 0 # default minimum stock value is on first(0th) day
  best_buy = 0
  best_sell = 0
  best_profit = 0
  # by default best time to buy is on first(0th) day and best time to sell is on first(0th) day
  # so you are 0$ in profit
  stock_prices.each_index do |day| # each array index represents day of stock value
    stock_price = stock_prices[day]
    if stock_price - min_stock > best_profit
      best_profit = stock_price - min_stock
      best_buy = min_stock_idx
      best_sell = day
    end
    if stock_price < min_stock
      min_stock = stock_price
      min_stock_idx = day
    end
  end

  [best_buy, best_sell]
end
