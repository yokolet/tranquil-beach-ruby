class ColumnNumber
  # @param {String} s
  # @return {Integer}
  def title_to_number(s)
    result = 0
    s.size.times do |i|
      result *= 26
      result += (s[i].ord - 'A'.ord + 1)
    end
    result
  end
end