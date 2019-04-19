require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count 
  end

  def get(key)
    if @map.include?(key)
      update_node!(Node.new(key, @map[key].val))
    else
      add_node(key, @prc.call(key))
    end
    @map[key] = @store.last
   
    if count > @max
      eject!
    end

     @map[key].val
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
    current_node = @map[node.key]
    current_node.remove
    @store.append(current_node.key, current_node.val)
  end

  def add_node(key, value)
    @store.append(key, value)
  end

  def eject!
    key = @store.first.key
    @store.first.remove
    @map.delete(key)
  end
end
