class Monotonic
  # @param {Integer[]} a
  # @return {Boolean}
  def is_monotonic(a)
    factor = a[0] <= a[-1] ? 1 : -1
    prev = a[0]
    a.each do |x|
      return false if (x - prev) * factor < 0
      prev = x
    end
    true
  end
end