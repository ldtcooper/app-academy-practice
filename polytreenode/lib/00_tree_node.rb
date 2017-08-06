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


end
