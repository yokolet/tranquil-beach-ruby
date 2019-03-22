class ReorderList
  # @param {ListNode} head
  # @return {Void} Do not return anything, modify head in-place instead.
  def reorder_list(head)
    return if head.nil?
    slow, fast = head, head
    while fast && fast.next # find half point
      slow = slow.next
      fast = fast.next.next
    end
    rev, cur, tmp = nil, slow.next, nil
    slow.next = nil
    while cur # reverse last half
      tmp = cur.next
      cur.next = rev
      rev = cur
      cur = tmp
    end
    cur = head
    while rev
      tmp, tmp2 = cur.next, rev.next
      cur.next = rev
      rev.next = tmp
      cur = tmp
      rev = tmp2
    end
  end
end