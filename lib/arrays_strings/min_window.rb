class MinWindow
  # @param {String} s
  # @param {String} t
  # @return {String}
  def min_window(s, t)
    missing, left, min_left, min_right = t.size, 0, 0, s.size
    memo = Hash.new { |h, k| h[k] = 0 }
    t.size.times { |i| memo[t[i]] += 1 }
    s.size.times do |i|
      if memo[s[i]] > 0
        missing -= 1
      end
      memo[s[i]] -= 1
      if missing == 0
        while memo[s[left]] < 0
          memo[s[left]] += 1
          left += 1
        end
        if i - left < min_right - min_left
          min_left, min_right = left, i
        end
        memo[s[left]] += 1
        missing += 1
        left += 1
      end
    end
    return '' if min_right == s.size else s[min_left..min_right]
  end
end