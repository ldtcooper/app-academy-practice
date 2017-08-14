require_relative 'deck'
class Hand
  def initialize(cards)
    cards.length == 5 ? @cards = cards : raise("must have five cards")
  end

    attr_reader :cards

  def trade_cards(take_cards, new_cards)
    if take_cards.any? { |el| !@cards.include?(el) }
      raise("cannot discard unowned card")
    elsif (@cards - take_cards + new_cards).length != 5
      raise("must have five cards")
    else
      @cards -= take_cards
      @cards += new_cards
    end
  end

  def rank
    case
    when straight_flush?
      return :straight_flush
    end 
  end

  HANDS = { straight_flush: 8, full_house: 7, flush: 6,
            straight: 5, four_of_a_kind: 4, three_of_a_kind: 3,
            two_pair: 2, one_pair: 1, high_card: 0 }.freeze

  def straight_flush?
    @cards.each_with_index do |el, ind|
      break if ind == 4
      return false if Card::values[el.value] != el.value += 1
    end
    true
  end

end
