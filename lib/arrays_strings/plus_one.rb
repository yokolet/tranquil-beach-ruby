class PlusOne
  # @param {Integer[]} digits
  # @return {Integer[]}
  def plus_one(digits)
    (digits.size-1).downto(0) do |i|
      if digits[i] != 9
        digits[i] += 1
        return digits
      else
        digits[i] = 0
      end
    end
    [1] + Array.new(digits.size, 0)
  end
end