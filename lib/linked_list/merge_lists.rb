require "#{File.dirname(__FILE__)}/list_node.rb"

class MergeLists
  # @param {ListNode[]} lists
  # @return {ListNode}
  def merge_k_lists(lists)
    head = ListNode.new(nil)
    cur = head
    values = []
    lists.each do |list|
      while list
        cur.next = list
        values << list.val
        cur = cur.next
        list = list.next
      end
    end
    cur = head.next
    values.sort().each do |v|
      cur.val = v
      cur = cur.next
    end
    head.next
  end
end