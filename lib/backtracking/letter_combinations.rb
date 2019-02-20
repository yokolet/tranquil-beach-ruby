class LetterCombinations
  # @param {String} digits
  # @return {String[]}
  def letter_combinations(digits)
    return [] if digits.nil? || digits.empty?
    letters = {
        '2' => ['a', 'b', 'c'],
        '3' => ['d', 'e', 'f'],
        '4' => ['g', 'h', 'i'],
        '5' => ['j', 'k', 'l'],
        '6' => ['m', 'n', 'o'],
        '7' => ['p', 'q', 'r', 's'],
        '8' => ['t', 'u', 'v'],
        '9' => ['w', 'x', 'y', 'z']
    }
    n = digits.size
    result = letters[digits[0]]
    return result if n == 1
    (1...n).each do |idx|
      result = result.reduce([]) {|acc, s| acc + letters[digits[idx]].map {|l| s + l}}
    end
    result
  end
end