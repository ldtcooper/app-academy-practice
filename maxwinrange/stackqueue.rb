require_relative "my_stack"

class StackQueue
  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  attr_reader :max, :min

  def enqueue(el)
    @in_stack.push(el)
    max_check
    min_check
  end

  def dequeue
    if @out_stack.empty?
      until @in_stack.empty?
        el = @in_stack.pop
        @out_stack.push(el)
      end
    end
    @out_stack.pop
  end

  def size
    @in_stack.size + @out_stack.size
  end

  def empty?
    @in_stack && @out_stack
  end

  private

  def max_check
    @max = @in_stack.max
  end

  def min_check
    @min = @in_stack.min
  end
end
