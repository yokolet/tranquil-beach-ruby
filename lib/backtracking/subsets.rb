class Subsets
  # @param {Integer[]} nums
  # @return {Integer[][]}
  def subsets(nums)
    nums.reduce([[]]) { |acc, x| acc + acc.map { |y| y + [x]}}
  end
end