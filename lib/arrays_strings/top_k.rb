class TopK
  # @param {Integer[]} nums
  # @param {Integer} k
  # @return {Integer[]}
  def top_k_frequent(nums, k)
    counts = {}
    nums.each do |v|
      counts[v] ||= 0
      counts[v] += 1
    end
    topk = counts.sort_by { |_, v| -v }[0, k]
    topk.map { |kv| kv[0] }
  end
end