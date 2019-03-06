class Wildcard
  # @param {String} s
  # @param {String} p
  # @return {Boolean}
  def is_match(s, p)
    i, j, star_i, star_j = 0, 0, -1, -1
    while i < s.size
      if j < p.size && p[j] == '*'
        star_i, star_j = i, j
        j += 1
      elsif j < p.size && (s[i] == p[j] || p[j] == '?')
        i += 1
        j += 1
      elsif star_i >=0
        i, j = star_i + 1, star_j + 1
        star_i += 1
      else
        return false
      end
    end
    while j < p.size && p[j] == '*'
      j += 1
    end
    j == p.size
  end
end