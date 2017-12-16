class MaxIntSet
  def initialize(max)
    @set = []
    @max = max
  end

  def insert(num)
    raise "Out of bounds" if num > @max || num < 0
    @set << num
  end

  def remove(num)
    @set.delete(num)
  end

  def include?(num)
    @set.include?(num)
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    index = num % num_buckets
    @store[index] << num unless include?(num)
  end

  def remove(num)
    index = num % num_buckets
    @store[index].delete(num)
  end

  def include?(num)
    @store.any? do |bucket|
      bucket.include?(num)
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count == num_buckets

    index = num % num_buckets
    unless include?(num)
      @store[index] << num
      @count += 1
    end
  end

  def remove(num)
    index = num % num_buckets
    @store[index].delete(num)
  end

  def include?(num)
    @store.any? do |bucket|
      bucket.include?(num)
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_arr = Array.new(2 * num_buckets) { Array.new }
    nums = @store.flatten

    @store = new_arr

    nums.each do |num|
      index = num % num_buckets
      @store[index] << num
    end
  end
end
