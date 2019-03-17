class Strobogrammatic
  # @param {String} num
  # @return {Boolean}
  def is_strobogrammatic(num)
    memo = {'0' => '0', '1' => '1', '6' => '9', '8' => '8', '9' => '6'}
    left, right = 0, num.size - 1
    while left <= right
      return false if !memo.has_key?(num[left]) && !memo.has_key?(num[right])
      return false if memo[num[left]] != num[right]
      left += 1
      right -= 1
    end
    true
  end
end