class TopWords
  # @param {String[]} words
  # @param {Integer} k
  # @return {String[]}
  def top_k_frequent(words, k)
    counts = {}
    words.each do |w|
      counts[w] ||= 0
      counts[w] += 1
    end
    counts = counts.sort do |a, b|
      if b.last == a.last
        a.first <=> b.first
      else
        b.last <=> a.last
      end
    end
    counts.map(&:first)[0, k]
  end
end