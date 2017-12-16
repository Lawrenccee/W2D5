require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count == num_buckets

    index = key.hash % num_buckets
    unless include?(key)
      @store[index] << key
      @count += 1
    end
  end

  def include?(key)
    @store.any? do |bucket|
      bucket.include?(key)
    end
  end

  def remove(key)
    index = key.hash % num_buckets
    @store[index].delete(key)
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
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
      index = num.hash % num_buckets
      @store[index] << num
    end
  end
end
