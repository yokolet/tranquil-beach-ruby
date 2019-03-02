class SqrtApprox
  # @param {Integer} x
  # @return {Integer}
  def my_sqrt(x)
    i = x
    while i * i > x
      i = (i + x / i) / 2
    end
    i.to_i
  end
end
