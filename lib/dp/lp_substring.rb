class LongestPalindromicSubstring
  # @param {String} s
  # @return {String}
  def longest_palindrome(s)
    return "" if s.nil? || s.empty?
    max_length = 1
    start = 0
    (1...s.size).each do |i|
      if i - max_length >= 1 &&
          s[i-max_length-1..i] == s[i-max_length-1..i].reverse
        start = i - max_length - 1
        max_length += 2
      elsif i - max_length >= 0 &&
          s[i-max_length..i] == s[i-max_length..i].reverse
        start = i - max_length
        max_length += 1
      end
    end
    s[start...(start+max_length)]
  end

  def longest_palindrome2(s)
    n = s.length
    result = nil
    memo = Array.new(n){Array.new(n, false)}
    (n - 1).downto(0) do |i|
      (i...n).each do |j|
        memo[i][j] = s[i] == s[j] && (j - i < 3 || memo[i + 1][j - 1])
        if memo[i][j] && (result.nil? || (j - i + 1) > result.length)
          result = s[i...(j + 1)]
        end
      end
    end
    result
  end
end