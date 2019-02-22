class Coins
  # @param {Integer} n
  # @return {Integer}
  def arrange_coins(n)
    ((-1 + Math.sqrt(1 + 8 * n)) / 2).to_i
  end
end