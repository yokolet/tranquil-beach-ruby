require 'rspec'
Dir["./lib/graph/*.rb"].each {|file| require file }

describe 'Graph' do
  context NumberOfIslands do
    let(:obj) { NumberOfIslands.new }

    it 'should count islands, 1' do
      grid = [["1","1","1","1","0"],["1","1","0","1","0"],["1","1","0","0","0"],["0","0","0","0","0"]]
      expected = 1
      expect(obj.num_islands(grid)).to eq(expected)
    end

    it 'should count islands, 3' do
      grid = [["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]
      expected = 3
      expect(obj.num_islands(grid)).to eq(expected)
    end
  end
end