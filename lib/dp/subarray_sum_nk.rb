class SubarraySumNK
  # @param {Integer[]} nums
  # @param {Integer} k
  # @return {Boolean}
  def check_subarray_sum(nums, k)
    sum, memo = 0, {0 => -1}
    nums.size.times do |i|
      if k != 0
        sum = (sum + nums[i]) % k
      else
        sum += nums[i]
      end
      if memo.has_key?(sum)
        return true if i - memo[sum] >= 2
      else
        memo[sum] = i
      end
    end
    false
  end
end