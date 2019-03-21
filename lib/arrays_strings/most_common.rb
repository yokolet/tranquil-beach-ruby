class MostCommon
  # @param {String} paragraph
  # @param {String[]} banned
  # @return {String}
  def most_common_word(paragraph, banned)
    memo = Hash.new { |h, k| h[k] = 0 }
    max_count = 0
    result = nil
    paragraph.downcase.scan(/\w+/).each do |word|
      memo[word] += 1 if !banned.include?(word)
      if max_count < memo[word]
        max_count = memo[word]
        result = word
      end
    end
    result
  end
end