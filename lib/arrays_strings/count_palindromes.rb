class CountPalindromes
  # @param {String} s
  # @return {Integer}
  def count_substrings(s)
    return 0 if s.nil? || s.empty?
    result, center = 0, 0
    while center < s.size
      right = center + 1
      while right < s.size && s[right] == s[center]
        right += 1
      end
      result += (right - center) * (right - center + 1) / 2
      l = center - 1
      r = right
      while l >= 0 && r < s.size && s[l] == s[r]
        l -= 1
        r += 1
        result += 1
      end
      center = right
    end
    result
  end
end