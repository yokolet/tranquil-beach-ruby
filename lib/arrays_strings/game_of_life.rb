class GameOfLife
  # @param {Integer[][]} board
  # @return {Void} Do not return anything, modify board in-place instead.
  def game_of_life(board)
    m = board.size
    n = board[0].size
    calc =-> (i, j) {
      neighbors = [
          [i-1, j-1], [i-1, j], [i-1, j+1],
          [i, j-1], [i, j+1],
          [i+1, j-1], [i+1, j], [i+1, j+1]
      ]
      sum = 0
      neighbors.each do |neighbor|
        r, c = neighbor[0], neighbor[1]
        if 0 <= r && r < m && 0 <= c && c < n
          sum += (board[r][c] & 1)
        end
      end
      sum
    }
    m.times do |i|
      n.times do |j|
        status = calc.call(i, j)
        if board[i][j] == 1 && (status == 2 || status == 3)
          board[i][j] = 3
        else
          if status == 3
            board[i][j] = 2
          end
        end
      end
    end
    m.times do |i|
      n.times do |j|
        board[i][j] >>= 1
      end
    end
  end
end