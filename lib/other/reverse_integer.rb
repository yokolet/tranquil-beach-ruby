class ReverseInteger
  # @param {Integer} x
  # @return {Integer}
  def reverse(x)
    sign = x < 0 ? -1 : 1
    v = x.abs
    result = 0
    while v > 0
      v, rem = v.divmod(10)
      result = result * 10 + rem
    end
    result *= sign
    result < -2**31 || result > (2**31-1) ? 0 : result
  end
end