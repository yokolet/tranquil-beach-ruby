class PerfectNumber
  # @param {Integer} num
  # @return {Boolean}
  def check_perfect_number(num)
    return false if num <= 1
    sum = 1
    upper_bound = Math.sqrt(num).ceil
    (2...upper_bound).each do |i|
      if num % i == 0
        sum += i
        sum += (num / i)
      end
    end
    sum == num
  end
end