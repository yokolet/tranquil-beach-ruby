require "#{File.dirname(__FILE__)}/list_node.rb"

class ReverseLinkedList
  # @param {ListNode} head
  # @return {ListNode}
  def reverse_list(head)
    return head if head.nil?
    prev, cur = nil, head
    while cur
      next_ = cur.next
      cur.next = prev
      prev = cur
      cur = next_
    end
    prev
  end
end