class MoveZeros
  # @param {Integer[]} nums
  # @return {Void} Do not return anything, modify nums in-place instead.
  def move_zeroes(nums)
    zero = 0
    (0...nums.size).each do |i|
      if nums[i] != 0
        nums[i], nums[zero] = nums[zero], nums[i]
        zero += 1
      end
    end
  end
end