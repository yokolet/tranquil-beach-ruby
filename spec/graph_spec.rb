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

  context Alien do
    let(:obj) { Alien.new }

    it 'returns wertf' do
      words = [
          "wrt",
          "wrf",
          "er",
          "ett",
          "rftt"
      ]
      expected = "wertf"
      expect(obj.alien_order(words)).to eq(expected)
    end

    it 'returns zx' do
      words = [
          "z",
          "x"
      ]
      expected = "zx"
      expect(obj.alien_order(words)).to eq(expected)
    end

    it 'returns wertf' do
      words = [
          "z",
          "x",
          "z"
      ]
      expected = ""
      expect(obj.alien_order(words)).to eq(expected)
    end
  end

  context Bipartite do
    let(:obj) { Bipartite.new }

    it 'returns true' do
      graph = [[1,3], [0,2], [1,3], [0,2]]
      expect(obj.is_bipartite(graph)).to be_truthy
    end

    it 'returns false' do
      graph = [[1,2,3], [0,2], [0,1,3], [0,2]]
      expect(obj.is_bipartite(graph)).to be_falsey
    end
  end

  context Itinerary do
    let(:obj) { Itinerary.new }

    it 'returns route1' do
      tickets = [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]
      expected = ["JFK", "MUC", "LHR", "SFO", "SJC"]
      expect(obj.find_itinerary(tickets)).to eq(expected)
    end

    it 'returns route2' do
      tickets = [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
      expected = ["JFK","ATL","JFK","SFO","ATL","SFO"]
      expect(obj.find_itinerary(tickets)).to eq(expected)
    end

    it 'returns route3' do
      tickets = [["JFK","KUL"],["JFK","NRT"],["NRT","JFK"]]
      expected = ["JFK","NRT","JFK","KUL"]
      expect(obj.find_itinerary(tickets)).to eq(expected)
    end
  end
end