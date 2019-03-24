class MaxSum3
  # @param {Integer[]} nums
  # @param {Integer} k
  # @return {Integer[]}
  def max_sum_of_three_subarrays(nums, k)
    left, mid , right = 0, k, 2*k
    sum_l, sum_m, sum_r = nums[left, k].sum, nums[mid, k].sum, nums[right, k].sum
    max_l, max_m, max_r = sum_l, sum_l + sum_m, sum_l + sum_m + sum_r
    idx_l, idx_m, idx_r = left, [left, mid], [left, mid, right]
    while right < nums.size - k
      sum_l += (nums[left + k] - nums[left])
      sum_m += (nums[mid + k] - nums[mid])
      sum_r += (nums[right + k] - nums[right])
      if sum_l > max_l
        max_l = sum_l
        idx_l = left + 1
      end
      if max_l + sum_m > max_m
        max_m = max_l + sum_m
        idx_m = [idx_l, mid + 1]
      end
      if max_m + sum_r > max_r
        max_r = max_m + sum_r
        idx_r = idx_m + [right + 1]
      end
      left += 1
      mid += 1
      right += 1
    end
    idx_r
  end
end