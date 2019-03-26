class ColumnTitle
  # @param {Integer} n
  # @return {String}
  def convert_to_title(n)
    result = ""
    while n > 0
      n -= 1
      result = ((n % 26) + 'A'.ord).chr + result
      n /= 26
    end
    result
  end
end