# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

class BSTIterator
  # creates an instance
  # @param [TreeNode] root
  def initialize(root)
    @stack = []
    while root
      @stack << root
      root = root.left
    end
  end

  # returns the next smallest node value
  # @return [Integer]
  def next()
    if has_next
      node = @stack.pop
      cur = node.right
      while !cur.nil?
        @stack << cur
        cur = cur.left
      end
      return node.val
    end
  end

  # returns whether the next smallest node exists
  # @return [true] if exists
  def has_next()
    @stack.size > 0
  end
end