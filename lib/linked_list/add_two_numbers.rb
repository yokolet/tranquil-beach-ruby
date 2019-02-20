require "#{File.dirname(__FILE__)}/list_node.rb"

class AddTwoNumbers
  # @param {ListNode} l1
  # @param {ListNode} l2
  # @return {ListNode}
  def add_two_numbers(l1, l2)
    return l1 || l2 if l1.nil? || l2.nil?
    head = l1
    carry = 0
    while l1 && l2
      carry, rem = (l1.val + l2.val + carry).divmod(10)
      l1.val = rem
      cur, l1, l2 = l1, l1.next, l2.next
    end
    cur.next = l1 || l2
    while carry != 0
      if cur.next.nil?
        cur.next = ListNode.new(carry)
        break
      else
        carry, rem = (cur.next.val + carry).divmod(10)
        cur.next.val = rem
        cur = cur.next
      end
    end
    head
  end
end
