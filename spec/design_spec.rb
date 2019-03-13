require 'rspec'
Dir["#{File.dirname(__FILE__)}/../lib/design/*.rb"].each {|file| require file }

describe 'Design' do
  context WordDictionary do
    it 'add and search words' do
      ops = ["WordDictionary","add_word","add_word","add_word","search","search","search","search"]
      params = [[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]
      expected = [nil,nil,nil,nil,false,true,true,true]
      obj = Object::const_get(ops[0]).new(*params[0])
      result = [nil]
      ops[1..-1].zip(params[1..-1]).each do |op, param|
        result << obj.send(op, *param)
      end
      expect(result).to eq(expected)
    end
  end
end