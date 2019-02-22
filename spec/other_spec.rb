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
end
