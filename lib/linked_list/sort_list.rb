require "#{File.dirname(__FILE__)}/list_node.rb"

class SortList
  # @param {ListNode} head
  # @return {ListNode}
  def sort_list(head)
    return head if head.nil? || head.next.nil?
    merge =-> (l1, l2) {
      head_ = ListNode.new(nil)
      l0 = head_
      while l1 and l2
        if l1.val < l2.val
          l0.next, l1 = l1, l1.next
        else
          l0.next, l2 = l2, l2.next
        end
        l0 = l0.next
      end
      if l1
        l0.next = l1
      elsif l2
        l0.next = l2
      end
      head_.next
    }
    slow, fast, prev = head, head, nil
    while fast && fast.next
      slow, fast, prev = slow.next, fast.next.next, slow
    end
    prev.next = nil
    merge.call(sort_list(head), sort_list(slow))
  end
end