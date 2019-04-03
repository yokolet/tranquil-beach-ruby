class RandomPick
=begin
  :type w: Integer[]
=end
  def initialize(w)
    total = w.sum
    pvalues = w.map { |x| x.to_f / total }
    @psums = [pvalues[0]]
    (1...pvalues.size).each do |i|
      @psums << pvalues[i] + @psums[-1]
    end
    @psums[-1] = 1
  end


=begin
    :rtype: Integer
=end
  def pick_index()
    pick = rand
    left, right = 0, @psums.size-1
    while left < right
      mid = (left + right) / 2
      if pick >= @psums[mid]
        left = mid + 1
      else
        right = mid
      end
    end
    left
  end
end