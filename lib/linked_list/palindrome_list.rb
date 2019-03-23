class PalindromeList
  # @param {ListNode} head
  # @return {Boolean}
  def is_palindrome(head)
    slow, fast, rev = head, head, nil
    while fast && fast.next # find half point while reversing
      fast = fast.next.next
      rev, rev.next, slow = slow, rev, slow.next
    end
    slow = slow.next if fast
    while rev
      return false if rev.val != slow.val
      rev = rev.next
      slow = slow.next
    end
    true
  end
end