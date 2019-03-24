class CountPalindromes
  # @param {String} s
  # @return {Integer}
  def count_substrings(s)
    return 0 if s.nil? || s.empty?
    result, left = 0, 0
    while left < s.size
      right = left + 1
      while right < s.size && s[right] == s[left]
        right += 1
      end
      result += (right - left) * (right - left + 1) / 2
      l = left - 1
      r = right
      while l >= 0 && r < s.size && s[l] == s[r]
        l -= 1
        r += 1
        result += 1
      end
      left = right
    end
    result
  end
end