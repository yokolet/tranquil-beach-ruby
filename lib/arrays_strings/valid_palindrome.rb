class ValidPalindrome
  # @param {String} s
  # @return {Boolean}
  def is_palindrome(s)
    return true if s.size == 1
    s = s.downcase.delete '^a-z0-9'
    s == s.reverse
  end
end