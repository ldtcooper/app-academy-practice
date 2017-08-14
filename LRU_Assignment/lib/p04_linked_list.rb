require "byebug"
class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  def initialize
    @head = Node.new(:head, true)
    @tail = Node.new(:tail, true)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  include Enumerable

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
    @tail.prev == @head
  end

  def get(key)
    self.each do |el|
      return el.val if el.key == key
    end
    nil
  end

  def include?(key)
    self.each do |el|
      return true if el.key == key
    end
    false
  end

  def append(key, val)
    new_guy = Node.new(key, val)
    new_guy.prev = self.last
    new_guy.next = @tail
    self.last.next = new_guy
    @tail.prev = new_guy
  end

  def update(key, val)
    self.each do |el|
      if el.key == key
        el.val = val
        break
      end
    end
  end

  def remove(key)
    self.each do |el|
      el.remove if el.key == key
    end
  end

  def each(&prc)
    current = self.first
    until current == @tail
      prc.call(current)
      current = current.next
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
