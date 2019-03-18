class RomanToInteger
  # @param {String} s
  # @return {Integer}
  def roman_to_int(s)
    table = {'I'=>1, 'V'=>5, 'X'=>10, 'L'=>50, 'C'=>100, 'D'=>500, 'M'=>1000}
    result, prev = table[s[0]], table[s[0]]
    (1...s.size).each do |i|
      result += table[s[i]]
      if table[s[i]] > prev
        result -= 2*prev
      end
      prev = table[s[i]]
    end
    result
  end
end