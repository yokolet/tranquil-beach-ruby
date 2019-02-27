class SubarraySumK
  # @param {Integer[]} nums
  # @param {Integer} k
  # @return {Integer}
  def subarray_sum(nums, k)
    count, acc, memo = 0, 0, Hash.new(0)
    nums.each do |v|
      acc += v
      count += 1 if acc == k
      count += memo[acc - k]
      memo[acc] += 1
    end
    count
  end

  def subarray_sum3(nums, k)
    count, acc, memo = 0, 0, {0 => 1}
    nums.each do |v|
      acc += v
      if memo.has_key?(acc - k)
        count += memo[acc - k]
      end
      if memo.has_key?(acc)
        memo[acc] += 1
      else
        memo[acc] = 1
      end
    end
    count
  end

end