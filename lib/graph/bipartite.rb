class Bipartite
  # @param {Integer[][]} graph
  # @return {Boolean}
  def is_bipartite(graph)
    visited = {}
    graph.size.times do |vertex|
      if !visited.has_key?(vertex)
        stack = [vertex]
        visited[vertex] = 0
        while !stack.empty?
          cur = stack.pop
          graph[cur].each do |neighbor|
            if !visited.has_key?(neighbor)
              stack.push(neighbor)
              visited[neighbor] = visited[cur] ^ 1
            elsif visited[neighbor] == visited[cur]
              return false
            end
          end
        end
      end
    end
    true
  end
end