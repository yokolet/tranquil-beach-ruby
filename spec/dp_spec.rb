require 'rspec'
Dir["./lib/dp/*.rb"].each {|file| require file }

describe 'Dynamic Programming' do
  context Stock do
    let(:obj) { Stock.new }

    it 'returns 5 for [7,1,5,3,6,4]' do
      prices = [7,1,5,3,6,4]
      expected = 5
      expect(obj.max_profit(prices)).to eq(expected)
    end

    it 'returns 0 for [7,6,4,3,1]' do
      prices = [7,6,4,3,1]
      expected = 0
      expect(obj.max_profit(prices)).to eq(expected)
    end
  end
end
