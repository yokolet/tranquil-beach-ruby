class ValidParentheses
  # @param {String} s
  # @return {Boolean}
  def is_valid(s)
    return true if s.empty?
    stack = []
    pairs = {
        ')' => '(',
        ']' => '[',
        '}' => '{'
    }
    s.size.times do |i|
      c = s[i]
      if pairs.has_key?(c) # closing paren
        if stack.size > 0 && (stack[-1] == pairs[c])
          stack.pop
        else
          return false
        end
      else
        stack.push(c)
      end
    end
    stack.empty?
  end
end