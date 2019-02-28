class NumberOfIslands
  # @param {Character[][]} grid
  # @return {Integer}
  def num_islands(grid)
    return 0 if grid.empty? || grid[0].empty?
    cols = grid[0].size
    memo = Array.new(cols, 0)
    groups = [0]
    g_no = 1
    grid.each do |row|
      cols.times do |i|
        if row[i] == '0'
          memo[i] = 0
          next
        end
        up = groups[memo[i]]
        left = i == 0 ? groups[0] : groups[memo[i - 1]]
        if up == 0 && left == 0
          memo[i] = g_no
          groups << g_no
          g_no += 1
        elsif up == 0
          memo[i] = left
        elsif left == 0
          memo[i] = up
        elsif up > left
          groups[up] = left
        else
          groups[left] = up
        end
      end
    end
    count = 0
    (1...groups.size).each do |i|
      if i == groups[i]
        count += 1
      end
    end
    count
  end
end