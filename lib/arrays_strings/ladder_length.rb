require 'set'
class LadderLength
  # @param {String} begin_word
  # @param {String} end_word
  # @param {String[]} word_list
  # @return {Integer}
  def ladder_length(begin_word, end_word, word_list)
    return 0 if !word_list.include?(end_word)
    n, visited, word_set = begin_word.size, Set.new, Set.new(word_list)
    begin_set, end_set = Set[begin_word], Set[end_word]
    letters = ("a".."z").to_a
    level = 1 # begin word
    while !begin_set.empty? && !end_set.empty?
      level += 1
      nextLayer = Set.new
      begin_set.each do |word|
        n.times do |i|
          prefix, suffix = word[0, i], word[i+1, n-i]
          letters.each do |c|
            next_word = prefix + c + suffix
            return level if end_set.include?(next_word)
            if word_set.include?(next_word) && !visited.include?(next_word)
              visited.add(next_word)
              nextLayer.add(next_word)
            end
          end
        end
      end
      begin_set = nextLayer
      if begin_set.size > end_set.size
        begin_set, end_set = end_set, begin_set
      end
    end
    0
  end
end