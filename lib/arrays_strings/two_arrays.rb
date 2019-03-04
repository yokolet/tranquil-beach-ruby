class TwoArrays
  # @param {Integer[]} nums1
  # @param {Integer[]} nums2
  # @return {Integer[]}
  def intersect(nums1, nums2)
    if nums1.size < nums2.size
      nums1, nums2 = nums2, nums1
    end
    memo, result = {}, []
    memo.default = 0
    nums1.each { |v| memo[v] += 1 }
    nums2.each do |v|
      if memo.has_key?(v) && memo[v] > 0
        result << v
        memo[v] -= 1
      end
    end
    result
  end
end