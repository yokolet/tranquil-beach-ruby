class PrisonCells
  # @param {Integer[]} cells
  # @param {Integer} n
  # @return {Integer[]}
  def prison_after_n_days(cells, n)
    patterns = {}
    while n > 0
      if patterns.has_key?(cells)
        n %= (patterns[cells] - n)
      end
      patterns[cells] = n
      if n >= 1
        n -= 1
        cells = (0..7).map do |i|
          next 0 if i == 0 || i == 7
          cells[i-1] ^ cells[i + 1] ^ 1
        end
      end
    end
    cells
  end
end