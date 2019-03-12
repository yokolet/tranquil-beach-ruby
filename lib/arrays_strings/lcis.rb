class Lcis
  # @param {Integer[]} nums
  # @return {Integer}
  def find_length_of_lcis(nums)
    return 0 if nums.nil? || nums.empty?
    max_length, length, prev = 1, 1, nums[0]
    (1...nums.length).each do |i|
      if prev < nums[i]
        length += 1
      else
        max_length = [max_length, length].max
        length = 1
      end
      prev = nums[i]
    end
    [max_length, length].max
  end
end