class AllAnagrams
  # @param {String} s
  # @param {String} p
  # @return {Integer[]}
  def find_anagrams(s, p)
    return [] if s.size < p.size
    target = p.split('').reduce({}) {|acc, c| acc.has_key?(c) ? acc[c] += 1 : acc[c] = 1; acc}
    counts, left, result = {}, 0, []
    counts.default = 0
    s.size.times do |i|
      if !target.has_key?(s[i])
        counts, left = {}, i + 1
        next
      end
      counts[s[i]] = counts[s[i]] ? counts[s[i]] + 1 : 1
      if i - left + 1 == p.size
        if counts == target
          result << left
        end
        counts[s[left]] -= 1
        left += 1
      end
    end
    result
  end
end