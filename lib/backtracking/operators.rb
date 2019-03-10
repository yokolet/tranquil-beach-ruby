class Operators
  # @param {String} num
  # @param {Integer} target
  # @return {String[]}
  def add_operators(num, target)
    return [] if num.nil? || num.empty?
    values = num.split('').map(&:to_i)
    n = values.size
    if n == 1
      return [num] if values[0] == target
      return []
    end

    result = []
    dfs = ->(i, expr, acc, last, cur) {
      if i == n - 1
        if acc + last + values[i] == target
          result << expr + '+' + num[i]
        end
        if acc + last - values[i] == target
          result << expr + '-' + num[i]
        end
        if acc + last * values[i] == target
          result << expr + '*' + num[i]
        end
        if cur > 0 and acc + last / cur * (10 * cur + values[i]) == target
          result << expr + num[i]
        end
      else
        dfs.call(i + 1, expr + '+' + num[i], acc + last, values[i], values[i])
        dfs.call(i + 1, expr + '-' + num[i], acc + last, -values[i], values[i])
        dfs.call(i + 1, expr + '*' + num[i], acc, last * values[i], values[i])
        if cur > 0
          dfs.call(i + 1, expr + num[i], acc, last / cur * (10 * cur + values[i]), 10 * cur + values[i])
        end
      end
    }
    dfs.call(1, num[0], 0, values[0], values[0])
    result
  end
end