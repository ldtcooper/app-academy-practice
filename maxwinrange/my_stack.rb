class MyStack
  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  attr_reader :max, :min

  def push(el)
    @store.push(el)
    max_check(el)
    min_check(el)
  end

  def pop
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  private

  def max_check(el)
    if @max.nil? || @max < el
      @max = el
    end
  end

  def min_check(el)
    if @min.nil? || @min > el
      @min = el
    end
  end

end

m = MyStack.new
m.push(3)
p m.max
p m.min
m.push(1)
p m.max
p m.min
m.push(2)
p m.max
p m.min
m.push(4)
p m.max
p m.min
