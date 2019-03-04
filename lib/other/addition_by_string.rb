class AdditionByString
  # @param {String} num1
  # @param {String} num2
  # @return {String}
  def add_strings(num1, num2)
    i, j, carry, result = num1.size - 1, num2.size - 1, 0, ""
    while i >=0 || j >= 0 || carry > 0
      if i >= 0
        carry += num1[i].to_i
      end
      if j >= 0
        carry += num2[j].to_i
      end
      carry, v = carry.divmod(10)
      result = v.to_s + result
      i -= 1
      j -= 1
    end
    result
  end
end