class Division
  # @param {Integer} dividend
  # @param {Integer} divisor
  # @return {Integer}
  def divide(dividend, divisor)
    if (dividend >= 0 and divisor >= 0) or (dividend < 0 and divisor < 0)
      sign = 1
    else
      sign = -1
    end
    n, d = dividend.abs, divisor.abs
    result = 0
    while d <= n
      tmp, count = d, 1
      while tmp <= n
        n -= tmp
        result += count
        count <<= 1
        tmp <<= 1
      end
    end
    result *= sign
    [[-2**31, result].max, 2**31 - 1].min
  end
end