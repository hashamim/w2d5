class MaxIntSet
  attr_accessor :store, :max
  def initialize(max)
    @store = Array.new(max + 1, false)
    @max = max
  end

  def insert(num)
    raise "Out of bounds" if num > max || num < 0
    @store[num] = true
  end

  def remove(num)
    raise if num > max || num < 0
    @store[num] = false
  end

  def include?(num)
    return @store[num]
  end

  private 

  def is_valid?(num)
    raise if num > max || num < 0
  end

  def validate!(num)
    
  end
end


class IntSet
  attr_accessor :store
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
    # optional but useful; return the bucket corresponding to `num`
    store[num % store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      if @count == num_buckets
        resize!
      end
      self[num] << num
      @count += 1
    end
 
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1 
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp_storage = @store
    @store = Array.new(num_buckets * 2){Array.new}
    temp_storage.each do |bucket|
      bucket.each do |ele|
        self[ele] << ele
      end
    end
  end
end
