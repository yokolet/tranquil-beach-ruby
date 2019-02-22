class Stock
  # @param {Integer[]} prices
  # @return {Integer}
  def max_profit(prices)
    return 0 if prices.nil? || prices.empty?
    min_price = prices.shift
    profit = 0
    prices.each do |p|
      if p < min_price
        min_price = p
      elsif p - min_price > profit
        profit = p - min_price
      end
    end
    profit
  end
end