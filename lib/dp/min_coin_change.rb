class MinCoinChange
  # @param {Integer[]} coins
  # @param {Integer} amount
  # @return {Integer}
  def coin_change(coins, amount)
    memo = Array.new(amount + 1, -1)
    memo[0] = 0
    coins.each do |coin|
      (1..amount).each do |i|
        if coin <= i && memo[i - coin] > -1
          memo[i] = memo[i - coin] + 1 if memo[i] == -1 || memo[i - coin] + 1 < memo[i]
        end
      end
    end
    memo[amount]
  end
end