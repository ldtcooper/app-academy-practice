class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    this_ord = 694_847_539
    self.each_with_index do |el, ind|
      this_ord ^= (el.hash * ind)
    end
    this_ord
  end
end

class String
  def hash
    this_ord = 15_485_867
    self.each_char.with_index do |el, ind|
      this_ord ^= (el.ord. * ind)
    end
    this_ord
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    this_ord = 334_214_459
    hsh_arr = self.sort_by(&:first)
    hsh_arr.to_a.each_with_index do |subarr, ind|
      subarr.each do |el|
        this_ord ^= (el.hash * ind)
      end
    end
    this_ord
  end
end
