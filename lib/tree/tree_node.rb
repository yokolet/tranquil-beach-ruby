class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end

  # @param {String} s
  # @return {TreeNode}
  def self.str2tree(s)
    return nil if s.nil? || s.empty?
    root, _ = self.walk(s, 0, s.size)
    root
  end

  def self.walk(s, index, size)
    root = TreeNode.new(nil)
    start = index
    while index < size
      if s[index] == "("
        index += 1
        if root.left == nil
          root.left, index = walk(s, index, size)
        else
          root.right, index = walk(s, index, size)
          root.left = nil if root.left.val.nil?
        end
      elsif s[index] == ")"
        index += 1
        return root, index
      elsif s[index] == "-"
        index += 1
      else
        while index < size && s[index] != ")" && s[index] != "(" && s[index] != "-"
          index += 1
        end
        root.val = s.slice(start...index).to_i
      end
    end
    return root, index
  end

  # @param {TreeNode} root
  # @return {String}
  def self.tree2str(root)
    return traverse(root, '')
  end

  def self.traverse(root, result)
    return result if root.nil?
    result += root.val.to_s
    if root.left or root.right
      result += '('
      result = traverse(root.left, result)
      result += ')'
      if root.right
        result += '('
        result = traverse(root.right, result)
        result += ')'
      end
    end
    result
  end
end
