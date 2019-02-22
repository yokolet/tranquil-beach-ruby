class Stairs
  # @param {Integer} n
  # @return {Integer}
  def climb_stairs(n)
    return 1 if n < 2
    memo = Array.new(n + 1, 0)
    memo[0] = 1 # no step. empty set
    memo[1] = 1 # only one step
    (2..n).each do |i|
      j = 1
      while j <= 2 && j <= i
        memo[i] += memo[i - j]
        j += 1
      end
    end
    memo[n]
  end
end