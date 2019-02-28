class RotatedSortedArray
  # @param {Integer[]} nums
  # @param {Integer} target
  # @return {Integer}
  def search(nums, target)
    return -1 if nums.nil? || nums.empty?
    low, high = 0, nums.size - 1
    while low <= high
      mid = (low + high) / 2
      return mid if nums[mid] == target
      if nums[low] <= nums[mid]
        if nums[low] <= target && target < nums[mid]
          high = mid - 1
        else
          low = mid + 1
        end
      else
        if nums[mid] < target && target <= nums[high]
          low = mid + 1
        else
          high = mid - 1
        end
      end
    end
    return -1
  end
end