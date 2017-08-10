class TowersOfHanoiGame
  attr_reader :stacks

  def initialize(stacks = [[3, 2, 1], [], []])
    @stacks = stacks
  end

  def render
    @stacks.map.with_index do |tower, ind|
      "Tower #{ind}:  #{tower.join("  ")}"
    end.join("\n") + "\n"
  end

  def move(from, to)
    
  end

  def game_won?

  end
end
