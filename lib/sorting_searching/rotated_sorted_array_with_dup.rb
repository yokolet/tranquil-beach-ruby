class RotatedSortedArrayWithDup
  # @param {Integer[]} nums
  # @param {Integer} target
  # @return {Boolean}
  def search(nums, target)
    return false if nums.nil? || nums.empty?
    n = nums.size
    low, high = 0, n - 1
    while low <= high
      mid = (low + high) / 2
      return true if nums[mid] == target
      if nums[mid] == nums[low]
        low += 1
      elsif nums[low] < nums[mid]
        if nums[low] <= target && target < nums[mid]
          high = mid - 1
        else
          low = mid + 1
        end
      elsif nums[mid] <= nums[high]
        if nums[mid] < target && target <= nums[high]
          low = mid + 1
        else
          high = mid - 1
        end
      end
    end
    false
  end
end