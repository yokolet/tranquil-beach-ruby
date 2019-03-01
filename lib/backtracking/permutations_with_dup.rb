class PermutationsWithDup
  # @param {Integer[]} nums
  # @return {Integer[][]}
  def permute_unique(nums)
    n = nums.size
    done = false
    result = []
    nums.sort!
    while !done
      result << nums.dup
      i = n - 2
      while i >= 0
        break if nums[i] < nums[i + 1]
        i -= 1
      end
      if i == -1
        done = true
      else
        succ = n - 1
        while nums[succ] <= nums[i]
          succ -= 1
        end
        nums[i], nums[succ] = nums[succ], nums[i]
        nums[i+1..-1] = nums[i+1..-1].sort!
      end
    end
    result
  end
end