class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 0 if self.empty?

    result = nil

    self.each_with_index do |el, idx|
      if result
        result = result ^ (idx % el)
      else
        result = el
      end
    end

    result
  end
end

class String
  def hash
    return 0 if self.chars.empty?

    result = nil

    self.chars.each_with_index do |el, idx|
      if result
        result = result ^ (idx % el.ord)
      else
        result = el.ord
      end
    end

    result

  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.to_a.sort.each do |pair|
      result = result ^ (pair.first.hash + pair.last.hash)
    end
    result
  end
end
























###
