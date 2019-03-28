class ShortestDistance
  # @param {Integer[][]} grid
  # @return {Integer}
  def shortest_distance(grid)
    return -1 if grid.nil? || grid.empty? || grid[0].empty?
    m, n = grid.size, grid[0].size
    dists, reached = Array.new(m) { Array.new(n, 0) }, Array.new(m) { Array.new(n, 0) }
    counts = grid.map { |row | row.reduce(0) { |acc, col| acc += (col == 1 ? 1 : 0)  }}.sum
    m.times do |row|
      n.times do |col|
        next if grid[row][col] != 1
        cnt, visited = 1, Array.new(m) { Array.new(n, false) }
        queue = [[row, col, 0]]
        visited[row][col] = true
        while !queue.empty?
          r, c, d = queue.shift
          reached[r][c] += 1
          [[r-1, c], [r, c-1], [r, c+1], [r+1, c]].each do |i, j|
            if 0 <= i && i < m && 0 <= j && j < n && !visited[i][j]
              visited[i][j] = true
              if grid[i][j] == 1
                cnt += 1
              elsif grid[i][j] == 0
                dists[i][j] += (d + 1)
                queue << [i, j, d + 1]
              end
            end
          end
        end
        return -1 if counts != cnt
      end
    end
    result = (m + n) * counts
    m.times do |i|
      n.times do |j|
        if grid[i][j] == 0 && reached[i][j] == counts && result > dists[i][j]
          result = dists[i][j]
        end
      end
    end
    result == (m + n) * counts ? -1 : result
  end
end