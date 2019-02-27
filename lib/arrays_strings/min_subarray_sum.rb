class MinSubarraySum
  # @param {Integer} s
  # @param {Integer[]} nums
  # @return {Integer}
  def min_sub_array_len(s, nums)
    n = nums.size
    return 0 if nums == 0 || (n == 1 && nums[0] < s)
    acc, left, min_len = 0, 0, n + 1
    (0...n).each do |i|
      acc += nums[i]
      while acc >= s
        min_len = [min_len, i - left + 1].min
        acc -= nums[left]
        left += 1
      end
    end
    min_len <= n ? min_len : 0
  end
end