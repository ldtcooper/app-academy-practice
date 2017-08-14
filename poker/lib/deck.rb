require_relative "card"
require_relative "hand"

class Deck

  def self.all_cards
    cards = []
    Card::suits.keys.each do |suit|
      Card::values.keys.each do |val|
        cards << Card.new(suit, val)
      end
    end
    cards
  end

  def initialize(cards = Deck::all_cards)
    @cards = cards
  end

  def count
    @cards.length
  end

  def take(n)
    if self.count >= n
      @cards.shift(n)
    else
      raise("not enough cards")
    end
  end

  def return(discards)
    @cards += discards
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_hand
    hand = self.take(5)
    Hand.new(hand)
  end
end
