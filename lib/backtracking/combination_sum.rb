class CombinationSum
  # @param {Integer[]} candidates
  # @param {Integer} target
  # @return {Integer[][]}
  def combination_sum(candidates, target)
    result = []
    dfs(candidates.sort, target, 0, [], result)
    result
  end

  def dfs(arr, target, index, path, result)
    if target == 0
      result << path
      return
    end
    while index < arr.size && arr[index] <= target
      dfs(arr, target-arr[index], index, path+[arr[index]], result)
      index += 1
    end
  end
end