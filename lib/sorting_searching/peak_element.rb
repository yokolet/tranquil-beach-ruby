class PeakElement
  # @param {Integer[]} nums
  # @return {Integer}
  def find_peak_element(nums)
    left, right = 0, nums.size-1
    while left < right
      mid = (left + right) / 2
      if nums[mid] > nums[mid+1]
        right = mid
      else
        left = mid + 1
      end
    end
    left
  end
end
