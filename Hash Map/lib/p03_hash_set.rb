class HashSet
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
    store[num.hash % num_buckets]
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

