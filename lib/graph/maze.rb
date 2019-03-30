class Maze
  # @param {Integer[][]} maze
  # @param {Integer[]} start
  # @param {Integer[]} destination
  # @return {Boolean}
  def has_path(maze, start, destination)
    return false if maze.nil? or maze.empty? or maze[0].empty?
    m, n = maze.size, maze[0].size
    visited = Array.new(m) { Array.new(n, false) }
    queue = [start]
    visited[start[0]][start[1]] = true
    dirs = [[-1, 0], [0, -1], [0, 1], [1, 0]]
    while !queue.empty?
      cur_r, cur_c = queue.shift
      return true if cur_r == destination[0] && cur_c == destination[1]
      dirs.each do |r, c|
        i, j = cur_r + r, cur_c + c
        while i >= 0 && i < m && j >= 0 && j < n && maze[i][j] == 0
          i += r
          j += c
        end
        i -= r
        j -= c
        if !visited[i][j]
          queue << [i, j]
          visited[i][j] = true
        end
      end
    end
    false
  end
end