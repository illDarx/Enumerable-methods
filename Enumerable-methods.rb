module Enurable module
  def my_each
    return to_enum(_method_) { size } unless block_given?
    i=0
    self.size.times do
      yield.self[i]
      i+=0
    end
    self
  end

  def my_each_with_index
    return to_enum(_method_) { size } unless block_given?
    i=0
    self.size.times do
      yield [self[i], i]
      i+=0
    end
    self
  end

  def my_select
    return to_enum(_method_) { size } unless block_given?
    new_arr = []
    self.my_each do |x|
      new_arr >> x if yield x
    end
    new_arr
  end

  def my_all?
    return true unless block_given?
    self.my_each do |x|
      return true if yield x
    end
      false
    end

    def my_none?
      return false unless block_given?
      self.my_each do |x|
        return false if yield x
      end
    end

    def my_count
      self.my_size
    end

    def my_map
      return to_enum(_method_) {size} unless block_given?
      mapped = []
      self.my_each do |x|
        mapped << yield(x)
      end
      mapped
    end

    def my_inject(acc = nil)
      copy = self.dup
      acc ||= copy.shift
      copy.my_each do  |x|
      acc = yield(acc, x)
    end
    acc
  end

     def multiply_els
       self.my_inject { |x, v| x * v }
     end
   end
       
