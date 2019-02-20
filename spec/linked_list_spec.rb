require 'rspec'
Dir["./lib/linked_list/*.rb"].each {|file| require file }

describe 'Linked List' do

  context AddTwoNumbers do
    let(:obj) { AddTwoNumbers.new }

    it 'returns l2 when l1 is nil' do
      l1 = nil
      l2 = ListNode.new(0)
      expect(obj.add_two_numbers(l1, l2)).to eq(l2)
    end

    it 'adds up two numbers' do
      l1 = ListNode.build([2, 4, 3])
      l2 = ListNode.build([5, 6, 4])
      expected = "7 -> 0 -> 8"
      result = obj.add_two_numbers(l1, l2)
      expect(ListNode.stringify(result)).to eq(expected)
    end

    it 'adds up two numbers to 90' do
      l1 = ListNode.build([9, 8])
      l2 = ListNode.build([1])
      expected = "0 -> 9"
      result = obj.add_two_numbers(l1, l2)
      expect(ListNode.stringify(result)).to eq(expected)
    end
  end

end