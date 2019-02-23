class CoinPatterns
  # @param {Integer} amount
  # @param {Integer[]} coins
  # @return {Integer}
  def change(amount, coins)
    memo = Array.new(amount + 1, 0)
    memo[0] = 1 # when amount = 0, empty pattern exists
    coins.each do |coin|
      (coin..amount).each do |i|
        if memo[i - coin] > 0
          memo[i] += memo[i - coin]
        end
      end
    end
    memo[amount]
  end
end