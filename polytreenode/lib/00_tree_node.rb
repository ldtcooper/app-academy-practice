class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def children= (value)
    @children = value
  end

  def value
    @value
  end

  def parent=(node)
    @parent.children -= [self] unless @parent.nil?
    @parent = node
    @parent.children << self unless node.nil?
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    unless self.children.include?(node)
      raise ArgumentError "node is not a child node!"
    end 
    node.parent = nil
  end

end
