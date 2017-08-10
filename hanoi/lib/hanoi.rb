class TowersOfHanoiGame

  attr_reader :stacks, :be_won

  def initialize(stacks = [[3, 2, 1], [], []])
    @stacks = stacks
  end

  def render
    @stacks.map.with_index do |tower, ind|
      "Tower #{ind}:  #{tower.join("  ")}"
    end.join("\n") + "\n"
  end

  def move(from, to)
    if @stacks[from].empty?
      raise("cannot move from empty stack")
    elsif @stacks[to].empty? || @stacks[to].last > @stacks[from].last
      @stacks[to] << @stacks[from].pop
    elsif @stacks[to].last < @stacks[from].last
      raise("cannot move onto smaller disk")
    end
  end

  def won?
    if @stacks[1].length == 3 || @stacks[2].length == 3
      true
    end
  end
end
