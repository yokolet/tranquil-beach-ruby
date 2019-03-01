class NextPermutation
  # @param {Integer[]} nums
  # @return {Void} Do not return anything, modify nums in-place instead.
  def next_permutation(nums)
    n = nums.size
    i = n - 2
    while i >= 0
      break if nums[i] < nums[i + 1]
      i -= 1
    end
    if i == -1
      nums.sort!
    else
      succ = n - 1
      while nums[succ] <= nums[i]
        succ -= 1
      end
      nums[i], nums[succ] = nums[succ], nums[i]
      nums[i+1..-1] = nums[i+1..-1].reverse
    end
  end
end