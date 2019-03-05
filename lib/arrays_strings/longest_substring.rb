class LongestSubstring
  # @param {String} s
  # @return {Integer}
  def length_of_longest_substring(s)
    left, max_length, memo = 0, 0, {}
    s.size.times do |i|
      if memo.has_key?(s[i])
        left = [left, memo[s[i]]].max
      end
      max_length = [max_length, i - left + 1].max
      memo[s[i]] = i + 1
    end
    max_length
  end
end