class MaxSubarraySumK
  # @param {Integer[]} nums
  # @param {Integer} k
  # @return {Integer}
  def max_sub_array_len(nums, k)
    max_length, sum_sofar, memo = 0, 0, {0 => -1}
    nums.each_with_index do |v, i|
      sum_sofar += v
      if memo.has_key?(sum_sofar - k)
        max_length = [max_length, i - memo[sum_sofar - k]].max
      end
      unless memo.has_key?(sum_sofar)
        memo[sum_sofar] = i
      end
    end
    max_length
  end
end