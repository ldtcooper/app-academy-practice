class MyQueue
  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  attr_reader :max, :min

  def enqueue(el)
    @store.push(el)
    max_check(el)
    min_check(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
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
