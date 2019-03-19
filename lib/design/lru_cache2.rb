class Entry
  attr_accessor :key, :value, :left, :right
  def initialize(key, value)
    @key = key
    @value = value
    @left = nil
    @right = nil
  end
end

class LRUCache

=begin
    :type capacity: Integer
=end
  def initialize(capacity)
    @capacity = capacity
    @entries = {} # key => entry
    @head, @tail = Entry.new(nil, nil), Entry.new(nil, nil)
    @head.right = @tail
    @tail.left = @head
  end

=begin
    :type key: Integer
    :rtype: Integer
=end
  def get(key)
    return -1 if !@entries.has_key?(key)
    e = @entries[key]
    change_top(e)
    e.value
  end

=begin
    :type key: Integer
    :type value: Integer
    :rtype: Void
=end
  def put(key, value)
    if @entries.has_key?(key)
      e = @entries[key]
      e.value = value
    else
      if @entries.size == @capacity
        tmp = @tail.left
        tmp.left.right = @tail
        @tail.left = tmp.left
        @entries.delete(tmp.key)
      end
      e = Entry.new(key, value)
      @entries[key] = e
    end
    change_top(e)
    nil
  end

  private
  def change_top(e)
    e.left.right = e.right if e.left
    e.right.left = e.left if e.right
    tmp = @head.right
    @head.right = e
    e.left = @head
    e.right = tmp
    tmp.left = e
  end
end
