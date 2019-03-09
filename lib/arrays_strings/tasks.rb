class Tasks
  # @param {Character[]} tasks
  # @param {Integer} n
  # @return {Integer}
  def least_interval(tasks, n)
    counts = {}
    tasks.each do |t|
      counts[t] ||= 0
      counts[t] += 1
    end
    counts = counts.values
    max_counts = counts.max
    same_counts = counts.count(max_counts)
    intervals = max_counts * same_counts
    intervals += (max_counts - 1) * (n - (same_counts - 1)) # between
    [tasks.size, intervals].max
  end
end