class ThreeSum
  # @param {Integer[]} nums
  # @return {Integer[][]}
  def three_sum(nums)
    memo = Hash.new(0)
    nums.each { |v| memo[v] += 1 }
    pos = []
    neg = []
    memo.keys.each { |key| key > 0 ? pos << key : neg << key}
    pos.sort
    neg.sort
    result = []
    if memo.has_key?(0) && memo[0] >= 3
      result << [0, 0, 0]
    end
    neg.each do |a|
      pos.each do |b|
        c = -(a + b)
        if !memo.has_key?(c)
          next
        end
        if c > b
          result << [a, b, c]
        elsif c < a
          result << [c, a, b]
        elsif [a, b].include?(c) && memo[c] > 1
          result << [a, c, b]
        end
      end
    end
    result
  end
end

=begin
# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
    nums.sort!
      result = []
      (0...nums.size-2).each do |i|
        next if i > 0 && nums[i - 1] == nums[i]
        cur = nums[i]
        low = i + 1
        high = nums.size - 1
        while low < nums.size && high >= 0 && low < high
          v = nums[i] + nums[low] + nums[high]
          if v == 0
            result << [cur, nums[low], nums[high]]
            low += 1
            high -= 1
            while low < high && nums[low - 1] == nums[low]
              low += 1
            end
            while low < high && nums[high + 1] == nums[high]
              high -= 1
            end
          elsif v < 0
            low += 1
          else
            high -= 1
          end
        end
      end
      result
end
=end