class PalindromePairs
  # @param {String[]} words
  # @return {Integer[][]}
  def palindrome_pairs(words)
    result = []
    revWords = words.each_with_index.map {|w, i| [w.reverse, i]}.to_h
    words.each_with_index do |word, i|
      (0..word.size).each do |j|
        prefix, suffix = word[0...j], word[j..-1]
        if revWords.has_key?(prefix) &&
            revWords[prefix] != i &&
            suffix == suffix.reverse
          result << [i, revWords[prefix]]
        end
        if j > 0 && revWords.has_key?(suffix) &&
            revWords[suffix] != i &&
            prefix == prefix.reverse
          result << [revWords[suffix], i]
        end
      end
    end
    result
  end
end