class DecodeDigits
  # @param {String} s
  # @return {Integer}
  def num_decodings(s)
    return 0 if s.empty? || s[0] == '0'
    n = s.size
    memo = Array.new(n + 1, 0)
    memo[0] = 1 # 0 length
    memo[1] = 1 # s[0] must be 1-9
    (2..n).each do |i|
      ones, tens = s[i - 1], s[i - 2]
      if ones >= '1' && ones <= '9'
        memo[i] += memo[i - 1]
      end
      if tens == '1' || (tens == '2' and ones <= '6')
        memo[i] += memo[i - 2]
      end
    end
    memo[n]
  end
end