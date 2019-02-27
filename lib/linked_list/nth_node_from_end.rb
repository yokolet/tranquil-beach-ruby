require "#{File.dirname(__FILE__)}/list_node.rb"

class NthNodeFromEnd
  # @param {ListNode} head
  # @param {Integer} n
  # @return {ListNode}
  def remove_nth_from_end(head, n)
    root = ListNode.new(nil)
    root.next = head
    fast = root
    n.times { fast = fast.next }
    cur = root
    while fast.next
      fast = fast.next
      cur = cur.next
    end
    cur.next = cur.next.next
    root.next
  end
end