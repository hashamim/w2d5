class Integer
  # Integer#hash already implemented for you

end

class Array
  def hash
    total = 0
    self.each_with_index do |num,i|
      total += num * (i+1)
    end
    total.hash
  end

end

class String
  def hash
    total = 0
    self.each_char.with_index do |ch,i|
      total += ch.ord * (i + 1)
    end
    total.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    total = 0
    self.keys.each do |key|
      total += key.hash
    end
    self.values.each do |value|
      total += value.hash
    end
    total.hash
  end
end
