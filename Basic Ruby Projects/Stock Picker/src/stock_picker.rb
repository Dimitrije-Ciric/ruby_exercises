def stock_picker(stock_prices, default_result = [-1, -1])
    return default_result unless stock_prices.instance_of?(Array) and stock_prices.length > 0

    min_stock, min_stock_idx = stock_prices.first, 0 # default minimum stock value is on first(0th) day
    best_buy, best_sell, best_profit = 0, 0, 0
    # by default best time to buy is on first(0th) day and best time to sell is on first(0th) day
    # so you are 0$ in profit
    stock_prices.each_index do |day| # each array index represents day of stock value
        stock_price = stock_prices[day]
        if stock_price - min_stock > best_profit
            best_profit = stock_price - min_stock
            best_buy, best_sell = min_stock_idx, day
        end
        if stock_price < min_stock 
            min_stock, min_stock_idx = stock_price, day
        end
    end

    return [best_buy, best_sell]
end 