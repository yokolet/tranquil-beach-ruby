require "#{File.dirname(__FILE__)}/interval.rb"

class MinRooms
  # @param {Interval[]} intervals
  # @return {Integer}
  def min_meeting_rooms(intervals)
    starts = intervals.map{ |x| x.start }.sort!
    ends = intervals.map{ |x| x.end }.sort!

    i, j = 0, 0
    result = 0
    current = 0
    while i < intervals.length
      if starts[i] < ends[j]
        current += 1
        i +=1
        result = [result, current].max
      else
        current -=1
        j +=1
      end
    end
    result
  end

  def min_meeting_rooms3(intervals)
    start = intervals.map{|i|i.start}.sort!
    finish = intervals.map{|i|i.end}.sort!

    start_index, finish_index=0,0
    min = 0
    current = 0
    while(start_index < intervals.length)
      if start[start_index] < finish[finish_index]
        current+=1
        start_index +=1
        min = [min, current].max
      else
        current -=1
        finish_index +=1
        min = [min, current].max
      end
    end
    min
  end

  def min_meeting_rooms2(intervals)
    return 0 if intervals.nil? || intervals.empty?
    intervals = intervals.sort {|x, y| x.start <=> y.start}
    ends = [intervals[0].end]
    count = 1
    (1...intervals.size).each do |i|
      ends << intervals[i].end
      ends.sort!
      if intervals[i].start < ends[0]
        count += 1
      else
        ends.shift
      end
    end
    count
  end
end