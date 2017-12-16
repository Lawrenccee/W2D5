class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
    @prev = nil
    @next = nil
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @count = 0
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @count == 0
  end

  def get(key)

    current_node = @head.next

    until current_node.next.nil?
      return current_node.val if current_node.key == key
      current_node = current_node.next
    end

    nil
  end

  def include?(key)
    current_node = @head.next

    until current_node.next.nil?
      return true if current_node.key == key
      current_node = current_node.next
    end

    false
  end

  def append(key, val)
    node = Node.new(key, val)
    node.next = @tail
    node.prev = @tail.prev
    @tail.prev = node
    node.prev.next = node
    @count += 1
  end

  def update(key, val)
    current_node = @head.next

    until current_node.next.nil?
      current_node.val = val if current_node.key == key
      current_node = current_node.next
    end
  end

  def remove(key)
    current_node = @head.next

    until current_node.next.nil?
      if current_node.key == key
        current_node.remove
        break
      end
      current_node = current_node.next
    end
  end

  def each(&prc)
    current_node = @head.next

    until current_node.next.nil?
      prc.call(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
