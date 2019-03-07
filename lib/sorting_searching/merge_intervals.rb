require "#{File.dirname(__FILE__)}/interval.rb"

class MergeIntervals
  # @param {Interval[]} intervals
  # @return {Interval[]}
  def merge(intervals)
    intervals.sort! {|x, y| x.start <=> y.start }
    result = []
    intervals.each do |i|
      if result.empty? || result[-1].end < i.start
        result << i
      else
        result[-1].end = [result[-1].end, i.end].max
      end
    end
    result
  end

  def merge2(intervals)
    return [] if intervals.nil? || intervals.empty?
    intervals.sort! {|x, y| x.start <=> y.start }
    result = [intervals[0]]
    (1...intervals.size).each do |i|
      if intervals[i].start <= result[-1].end
        result[-1].end = [result[-1].end, intervals[i].end].max
      else
        result << intervals[i]
      end
    end
    result
  end
end