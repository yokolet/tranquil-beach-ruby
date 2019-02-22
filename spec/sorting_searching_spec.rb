require 'rspec'
Dir["./lib/sorting_searching/*.rb"].each {|file| require file }

describe 'Sorting and Searching' do

  context KthLargest do
    let(:obj) { KthLargest.new }

    it 'returns 5 for 2nd largest in [3,2,1,5,6,4]' do
      nums, k = [3,2,1,5,6,4], 2
      expected = 5
      expect(obj.find_kth_largest(nums, k)).to eq(expected)
    end

    it 'returns 4 for 4th largest in [3,2,3,1,2,4,5,5,6]' do
      nums, k = [3,2,3,1,2,4,5,5,6], 4
      expected = 4
      expect(obj.find_kth_largest(nums, k)).to eq(expected)
    end
  end

  context MinRooms do
    let(:obj) { MinRooms.new }

    it 'returns 2 for intervals [[0, 30],[5, 10],[15, 20]]' do
      arr = [[0, 30],[5, 10],[15, 20]]
      expected = 2
      intervals = arr.map { |interval| Interval.new(interval[0], interval[1]) }
      expect(obj.min_meeting_rooms(intervals)).to eq(expected)
    end

    it 'returns 1 for intervals [[7,10],[2,4]]' do
      arr = [[7,10],[2,4]]
      expected = 1
      intervals = arr.map { |interval| Interval.new(interval[0], interval[1]) }
      expect(obj.min_meeting_rooms(intervals)).to eq(expected)
    end

    it 'returns 2 for intervals [[2,11],[6,16],[11,16]]' do
      arr = [[2,11],[6,16],[11,16]]
      expected = 2
      intervals = arr.map { |interval| Interval.new(interval[0], interval[1]) }
      expect(obj.min_meeting_rooms(intervals)).to eq(expected)
    end
  end
end
