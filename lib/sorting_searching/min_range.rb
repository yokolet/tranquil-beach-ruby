class MinRange
  # @param {Integer[][]} nums
  # @return {Integer[]}
  def smallest_range(nums)
    all_nums = {}
    nums.each_with_index do |num, k|
      num.each do |v|
        all_nums[v] ||= Set.new
        all_nums[v].add(k)
      end
    end
    all_nums = all_nums.sort_by { |key, val| key }
    min_range, min_diff = [all_nums[0][0], all_nums[-1][0]], all_nums[-1][0] - all_nums[0][0]
    start, missing, memo = 0, nums.size, {}
    all_nums.each do |item|
      item[1].each do |k|
        memo[k] ||= 0
        if !memo.has_key?(k) || memo[k] <= 0
          missing -=1
        end
        memo[k] += 1
      end
      while missing <= 0 && all_nums[start][0] <= item[0]
        if item[0] - all_nums[start][0] < min_diff
          min_range = [all_nums[start][0], item[0]]
          min_diff = item[0] - all_nums[start][0]
        end
        all_nums[start][1].each do |k|
          memo[k] -= 1
          if memo[k] <= 0
            missing += 1
          end
        end
        start += 1
      end
    end
    min_range
  end
end