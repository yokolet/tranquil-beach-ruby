require 'set'

class WordDictionary
  # Instantiate WordDictionary
  def initialize()
    @table = Hash.new { |h, k| h[k] = Set.new } # {word_length => set of words}
  end

  # Adds a word into the data structure
  # @param [String] word
  # @return nil
  def add_word(word)
    @table[word.size].add(word)
    nil
  end

  # Returns true if the word is in the data structure.
  # A word could contain the dot character '.' to represent any one letter.
  #
  # @param [String] word
  # @return [true] if exists, false it not
  def search(word)
    length = word.size
    return false if !@table.has_key?(length)
    return true if @table[length].include?(word)
    tmp = @table[length]
    length.times do |i|
      next if word[i] == "."
      tmp = tmp.reduce([]) {|acc, e| acc << e if e[i] == word[i]; acc }
      return false if tmp.empty?
    end
    true
  end
end