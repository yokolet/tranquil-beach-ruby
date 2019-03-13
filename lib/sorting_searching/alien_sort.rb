class AlienSort
  # @param {String[]} words
  # @param {String} order
  # @return {Boolean}
  def is_alien_sorted(words, order)
    memo = {}
    order.size.times { |i| memo[order[i]] = i }
    (1...words.size).each do |i|
      prev, cur, i, j, sub = words[i - 1], words[i], 0, 0, true
      while i < prev.size && j < cur.size
        if memo[prev[i]] > memo[cur[j]]
          return false
        end
        if memo[prev[i]] < memo[cur[j]]
          sub = false
          break
        end
        i += 1
        j += 1
      end
      if prev.size > cur.size && sub
        return false
      end
    end
    true
  end
end