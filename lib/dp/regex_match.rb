class RegexMatch
  # @param {String} s
  # @param {String} p
  # @return {Boolean}
  def is_match(s, p)
    is_match_recur(s, p, 0, 0, {})
  end

  def is_match_recur(s, p, i, j, memo)
    unless memo.has_key?([i, j])
      if j == p.size
        memo[[i, j]] = i == s.size
      else
        memo[[i, j]] = i < s.size && ['.', s[i]].include?(p[j])
        if j + 1 < p.size && p[j + 1] == '*'
          memo[[i, j]] = is_match_recur(s, p, i, j + 2, memo) || (memo[[i, j]] && is_match_recur(s, p, i + 1, j, memo))
        else
          memo[[i, j]] = memo[[i, j]] && is_match_recur(s, p, i + 1, j + 1, memo)
        end
      end
    end
  end

  def is_match1(s, p)
    return false if s == nil || p == nil

    m = /#{p}/.match(s)
    return m != nil && m[0] == s
  end
end