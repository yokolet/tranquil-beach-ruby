class Itinerary
  # @param {string[][]} tickets
  # @return {String[]}
  def find_itinerary(tickets)
    graph = {}
    tickets.each do |src, dst|
      graph[src] ||= []
      graph[src] << dst
    end
    graph.each {|key, val| graph[key] = val.sort }

    result = []
    dfs =-> (city) {
      while graph[city] && !graph[city].empty?
        dfs.call(graph[city].shift)
      end
      result << city
    }
    dfs.call("JFK")
    result.reverse
  end
end