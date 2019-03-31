class MinStack

=begin
    initialize your data structure here.
=end
  def initialize()
    @stack = []
    @min_stack = []
  end

=begin
    :type x: Integer
    :rtype: Void
=end
  def push(x)
    @stack.append(x)
    if @min_stack.empty? || @min_stack[-1] >= x
      @min_stack.append(x)
    end
  end

=begin
    :rtype: Void
=end
  def pop()
    v = @stack.pop
    if @min_stack[-1] == v
      @min_stack.pop
    end
    v
  end

=begin
    :rtype: Integer
=end
  def top()
    @stack[-1]
  end

=begin
    :rtype: Integer
=end
  def get_min()
    @min_stack[-1]
  end
end