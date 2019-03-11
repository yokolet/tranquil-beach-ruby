class Product
  # @param {Integer[]} nums
  # @return {Integer[]}
  def product_except_self(nums)
    return [] if nums.nil? || nums.empty?
    acc, result = 1, []
    nums.each do |n|
      result << acc
      acc *= n
    end
    acc = 1
    (nums.size - 1).downto(0) do |i|
      result[i] *= acc
      acc *= nums[i]
    end
    result
  end
end