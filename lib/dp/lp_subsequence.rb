class LongestPalindromicSubsequence
  # @param {String} s
  # @return {Integer}
  def longest_palindrome_subseq(s)
    n = s.size
    return n if s == s.reverse
    prev = Array.new(n, 0)
    (n-1).downto(0) do |i|
      cur = Array.new(n, 0)
      cur[i] = 1
      (i+1...n).each do |l|
        if s[i] == s[l]
          cur[l] = prev[l - 1] + 2
        else
          cur[l] = [prev[l], cur[l-1]].max
        end
      end
      prev = cur
    end
    prev[-1]
  end
end