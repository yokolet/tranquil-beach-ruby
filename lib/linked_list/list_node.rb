class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end

  def self.build(ary)
    return nil if ary.nil? || ary.empty?
    head = cur = ListNode.new(-1)
    ary.each do |v|
      cur.next = ListNode.new(v)
      cur = cur.next
    end
    head.next
  end

  def self.stringify(l)
    result = ""
    while l
      result << l.val.to_s
      l = l.next
      result << " -> " if l
    end
    result
  end
end
