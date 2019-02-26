class PalindromeByDeletion
  # @param {String} s
  # @return {Boolean}
  def valid_palindrome(s)
    n = s.size
    return true if n <= 2 || s == s.reverse
    left, right = 0, n - 1
    while left < right
      if s[left] == s[right]
        left += 1
        right -= 1
      else
        return s[left+1..right] == s[left+1..right].reverse ||
                s[left...right] == s[left...right].reverse
      end
    end
    true
  end
end