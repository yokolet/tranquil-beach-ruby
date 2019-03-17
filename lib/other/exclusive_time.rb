class ExclusiveTime
  # @param {Integer} n
  # @param {String[]} logs
  # @return {Integer[]}
  def exclusive_time(n, logs)
    result = Array.new(n, 0)
    f, event, t = logs[0].split(":")
    stack = [f.to_i]
    units = t.to_i
    logs.each do |log|
      f, event, t = log.split(":")
      t_ = t.to_i
      if event == "start"
        result[stack[-1]] += (t_ - units)
        stack.push(f.to_i)
        units = t_
      else
        result[stack[-1]] += (t_ - units + 1)
        stack.pop
        units = t_ + 1
      end
    end
    result
  end
end