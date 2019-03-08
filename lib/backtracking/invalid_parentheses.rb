class InvalidParentheses
  # @param {String} s
  # @return {String[]}
  def remove_invalid_parentheses(s)
    result, parens = [], ['(', ')']
    remove(s, 0, 0, parens, result)
    result
  end

  def remove(s, last_i, last_j, parens, result)
    i, count  = last_i, 0
    while i < s.size
      count += 1 if s[i] == parens[0]
      count -= 1 if s[i] == parens[1]
      if count >= 0
        i += 1
        next
      end

      j = last_j
      while j <= i
        if s[j] == parens[1] && (j == last_j || s[j-1] != s[j])
          remove(s[0...j]+s[j+1..-1], i, j, parens, result)
        end
        j += 1
      end
      return
    end
    if parens[1] == ')'
      remove(s.reverse, 0, 0, [')', '('], result)
    else
      result << s.reverse
    end
  end
end