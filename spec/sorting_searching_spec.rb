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

  context SortedArray do
    let(:obj) { SortedArray.new }

    it 'should return sorted array' do
      nums1, m = [1,2,3,0,0,0], 3
      nums2, n = [2,5,6], 3
      expected = [1,2,2,3,5,6]
      obj.merge(nums1, m, nums2, n)
      expect(nums1).to eq(expected)
    end
  end

  context RotatedSortedArray do
    let(:obj) { RotatedSortedArray.new }

    it 'returns 4 for [4,5,6,7,0,1,2], 0' do
      nums = [4,5,6,7,0,1,2]
      target = 0
      expected = 4
      expect(obj.search(nums, target)).to eq(expected)
    end

    it 'returns -1 for [4,5,6,7,0,1,2], 3' do
      nums = [4,5,6,7,0,1,2]
      target = 3
      expected = -1
      expect(obj.search(nums, target)).to eq(expected)
    end

    it 'returns -1 for [], 5' do
      nums = []
      target = 5
      expected = -1
      expect(obj.search(nums, target)).to eq(expected)
    end

    it 'returns 1 for [1, 3], 1' do
      nums = [1,3]
      target = 1
      expected = 0
      expect(obj.search(nums, target)).to eq(expected)
    end

    it 'returns -1 for [5, 1, 3], 2' do
      nums = [5,1,3]
      target = 2
      expected = -1
      expect(obj.search(nums, target)).to eq(expected)
    end
  end

  context RotatedSortedArrayWithDup do
    let(:obj) { RotatedSortedArrayWithDup.new }

    it 'returns true for [2,5,6,0,0,1,2], 0' do
      nums = [2,5,6,0,0,1,2]
      target = 0
      expect(obj.search(nums, target)).to be_truthy
    end

    it 'returns false for' do
      nums = [2,5,6,0,0,1,2]
      target = 3
      expect(obj.search(nums, target)).to be_falsey
    end
  end

  context MergeIntervals do
    let(:obj) { MergeIntervals.new }

    it 'returns merged result for [[1,3],[2,6],[8,10],[15,18]]' do
      arr = [[1,3],[2,6],[8,10],[15,18]]
      expected = [[1,6],[8,10],[15,18]]
      intervals = arr.map { |interval| Interval.new(interval[0], interval[1]) }
      expect(obj.merge(intervals).map {|i| [i.start, i.end]}).to eq(expected)
    end

    it 'returns merged result for [[1,4],[4,5]]' do
      arr = [[1,4],[4,5]]
      expected = [[1,5]]
      intervals = arr.map { |interval| Interval.new(interval[0], interval[1]) }
      expect(obj.merge(intervals).map {|i| [i.start, i.end]}).to eq(expected)
    end
  end
end
