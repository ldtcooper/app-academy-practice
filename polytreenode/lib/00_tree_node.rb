class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent.dup
  end

  def children
    @children.dup
  end

  def value
    @value.dup
  end

  def parent=(p)

  end
end
