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

  context ReverseLinkedList do
    let(:obj) { ReverseLinkedList.new }

    it 'should reverse linked list' do
      head = ListNode.build([1, 2, 3, 4, 5])
      expected = "5 -> 4 -> 3 -> 2 -> 1"
      result = obj.reverse_list(head)
      expect(ListNode.stringify(result)).to eq(expected)
    end
  end

  context NthNodeFromEnd do
    let(:obj) { NthNodeFromEnd.new }

    it 'should remove node 4' do
      head = ListNode.build([1, 2, 3, 4, 5])
      n = 2
      expected = "1 -> 2 -> 3 -> 5"
      result = obj.remove_nth_from_end(head, n)
      expect(ListNode.stringify(result)).to eq(expected)
    end
  end

  context MergeLists do
    let(:obj) { MergeLists.new }

    it 'merges k lists' do
      lists = [
          ListNode.build([1, 4, 5]),
          ListNode.build([1, 3, 4]),
          ListNode.build([2, 6])
      ]
      expected = '1 -> 1 -> 2 -> 3 -> 4 -> 4 -> 5 -> 6'
      result = obj.merge_k_lists(lists)
      expect(ListNode.stringify(result)).to eq(expected)
    end
  end

  context ReorderList do
    let(:obj) { ReorderList.new }

    it 'returns "1 -> 4 -> 2 -> 3"' do
      head = ListNode.build([1, 2, 3, 4])
      expected = '1 -> 4 -> 2 -> 3'
      obj.reorder_list(head)
      expect(ListNode.stringify(head)).to eq(expected)
    end

    it 'returns "1 -> 5 -> 2 -> 4 -> 3"' do
      head = ListNode.build([1, 2, 3, 4, 5])
      expected = '1 -> 5 -> 2 -> 4 -> 3'
      obj.reorder_list(head)
      expect(ListNode.stringify(head)).to eq(expected)
    end

    it 'returns ""' do
      head = ListNode.build([])
      expected = ''
      obj.reorder_list(head)
      expect(ListNode.stringify(head)).to eq(expected)
    end
  end
end