require 'set'

class ClosestPalindrome
  # @param {String} n
  # @return {String}
  def nearest_palindromic(n)
    length = n.size
    closests = Set.new
    closests.add(10 ** length + 1) # if 99, adds 101
    closests.add(10 ** (length - 1) -1) # if 100, adds 99
    prefix = (n[0...((length + 1) / 2)]).to_i
    [-1, 0, 1].each do |i|
      left = (prefix + i).to_s
      if length % 2 == 0
        closests.add((left + left.reverse).to_i)
      else
        closests.add((left + left[0...-1].reverse).to_i)
      end
    end
    num, min_diff, result = n.to_i, 10 ** (length + 1), 0
    closests.delete(num) if closests.include?(num)
    closests.each do |v|
      diff = (v-num).abs
      if diff < min_diff
        min_diff = diff
        result = v
      elsif diff == min_diff
        result = [result, v].min
      end
    end
    result.to_s
  end
end