class Card

  include Comparable

  SUITS = { clubs: 1, hearts: 2, diamonds: 3, spades: 4 }.freeze

  VALUES = { ace: 14, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7,
             eight: 8, nine: 9, ten: 10, jack: 11, queen: 12, king: 13 }.freeze

  def initialize(suit, value)
    SUITS.include?(suit) ? @suit = suit : raise("Invalid suit!")
    VALUES.key?(value) ? @value = value : raise("Invalid value!")
  end

  attr_reader :suit, :value

  def <=>(other)
    if VALUES[self.value] == VALUES[other.value]
      if SUITS[self.suit] == SUITS[other.suit]
        0
      elsif SUITS[self.suit] > SUITS[other.suit]
        1
      else
        -1
      end
    elsif VALUES[self.value] > VALUES[other.value]
      1
    else
      -1
    end
  end

  def self.suits
    SUITS
  end

  def self.values
    VALUES
  end

end
