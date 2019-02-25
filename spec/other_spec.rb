require 'rspec'
Dir["./lib/other/*.rb"].each {|file| require file }

describe 'Other' do
  context Coins do
    let(:obj) { Coins.new }

    it 'returns 2 for n = 5' do
      n = 5
      expected = 2
      expect(obj.arrange_coins(n)).to eq(expected)
    end

    it 'returns 3 for n = 8' do
      n = 8
      expected = 3
      expect(obj.arrange_coins(n)).to eq(expected)
    end
  end

  context PalindromePairs do
    let(:obj) { PalindromePairs.new }

    it 'returns 4 pairs for ["abcd","dcba","lls","s","sssll"]' do
      words = ["abcd","dcba","lls","s","sssll"]
      expected = [[0,1],[1,0],[3,2],[2,4]]
      expect(obj.palindrome_pairs(words)).to eq(expected)
    end

    it 'returns 2 pairs for ["bat","tab","cat"]' do
      words = ["bat","tab","cat"]
      expected = [[0,1],[1,0]]
      expect(obj.palindrome_pairs(words)).to eq(expected)
    end
  end
end
