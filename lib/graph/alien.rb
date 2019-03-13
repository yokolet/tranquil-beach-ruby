class Alien
  # @param {String[]} words
  # @return {String}
  def alien_order(words)
    graph = Hash.new { |h, k| h[k] = [] }
    nodes = Set.new
    build = -> {
      prev = words[0]
      prev.split('').each { |c| nodes << c}
      (1...words.size).each do |i|
        cur = words[i]
        cur.split('').each { |c| nodes << c}
        i, j = 0, 0
        while i < prev.size && j < cur.size
          if prev[i] == cur[j]
            i += 1
            j += 1
          else
            graph[prev[i]] << cur[j]
            break
          end
        end
        prev = cur
      end
    }
    build.call()

    visited, visiting, result = Set.new, Set.new, []
    dfs = -> (node) {
      visiting << node
      graph[node].each do |child|
        if !visited.include?(child)
          if visiting.include?(child) # cycle
            return false
          else
            if !dfs.call(child)
              return false
            end
          end
        end
      end
      visited << node
      result << node
      return true
    }

    nodes.each do |node|
      if !visited.include?(node)
        if !dfs.call(node)
          return ""
        end
      end
    end

    result.reverse.join
  end
end