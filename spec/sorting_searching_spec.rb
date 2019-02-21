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
end
