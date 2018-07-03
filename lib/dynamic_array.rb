require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
   @length = 0
   @store = StaticArray.new(8)
   @capacity = 8
   @start_idx = 0
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if @store[index] == nil
    self.store[index]
  end

  # O(1)
  def []=(index, value)
    self.store[index] = value
    self.length += 1
    raise "index out of bounds" if self.store[index] == nil
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length == 0
    @length -= 1
    result = @store[self.length]
    @store = @store[0...-1]
    result
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if self.length == @capacity
      self.resize!
    end
      self.store[self.length] = val
      self.length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length == 0
    result = @store[0]
    @length -= 1
    @start_idx += 1
    @store = @store[@start_idx..@length]
    result
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
  if @length == 0
      @store[0] = val
      
    end
   @length.downto(1) do |i|
    @store[i] = @store[i - 1]
    @store[0] = val
   end
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity = @capacity * 2
    # @store = StaticArray.new(@capacity)
    
  end

end
