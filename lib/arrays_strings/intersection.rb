require 'set'
class Intersection
  # @param {Integer[]} nums1
  # @param {Integer[]} nums2
  # @return {Integer[]}
  def intersection(nums1, nums2)
    (Set.new(nums1) & Set.new(nums2)).to_a
  end

  # fast
  def intersection2(nums1, nums2)
    counts = Hash.new(0)
    nums1.each {|n| counts[n] += 1}
    is = []
    nums2.each do |n|
      is.push(n) if counts[n] > 0
      counts[n] = 0
    end
    is
  end
end