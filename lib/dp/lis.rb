class LIS
  # @param {Integer[]} nums
  # @return {Integer}
  def length_of_lis(nums)
    return 0 if nums.nil? || nums.empty?
    memo = Array.new(nums.size, 0)
    max_length = 0
    nums.each do |v|
      left, right = 0, max_length
      while left < right
        mid = (left + right) / 2
        if memo[mid] < v
          left = mid + 1
        else
          right = mid
        end
      end
      memo[left] = v
      max_length = [max_length, left + 1].max
    end
    return max_length
  end
end