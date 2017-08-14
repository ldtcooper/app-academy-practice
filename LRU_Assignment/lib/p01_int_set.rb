class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    else
      raise("Out of bounds")
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @store.length - 1)
  end

end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self.include?(num)
      self[num] << num
      @count += 1
      resize! if @count > num_buckets
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.dup
    @store = Array.new(2 * num_buckets) { Array.new }
    old_store.each do |subarr|
      subarr.each do |el|
        self[el] << el
      end
    end
  end
end
