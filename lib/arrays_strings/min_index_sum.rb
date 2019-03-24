class MinIndexSum
  # @param {String[]} list1
  # @param {String[]} list2
  # @return {String[]}
  def find_restaurant(list1, list2)
    rank = {}
    list1.each_with_index { |v, i| rank[v] = i }
    index_sum = 2000
    common = []
    list2.each_with_index do |v, i|
      break if i > index_sum
      if rank.has_key?(v)
        cur = i + rank[v]
        if index_sum == cur
          common << v
        elsif index_sum > cur
          index_sum = cur
          common = [v]
        end
      end
    end
    common
  end
end