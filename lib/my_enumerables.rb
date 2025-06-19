module Enumerable
  # Your code goes here
  def my_all?
    my_each do |ele|
      return false unless yield(ele)
    end
    true
  end

  def my_any?
  my_each do |ele|
    return true if yield(ele)
  end
  false
  end

  def my_count
    count = 0
    if block_given?
      my_each do |ele|
        if yield(ele)
          count += 1
        end
      end
      return count
    else
      return self.count
    end
  end

  def my_each_with_index
    i = 0
    my_each do |ele|
      yield(ele, i)
      i += 1
    end
  end

  def my_inject(num)
    x = num
    my_each do |ele|
      x = yield(x, ele)
    end
    return x
  end

  def my_map
    holder = []
    my_each do |ele|
      holder.push(yield(ele))
    end
    return holder
  end

  def my_none?
    my_each do |ele|
      return false if yield(ele)
    end
    true
  end

  def my_select
    holder = []
    my_each do |ele|
      if yield(ele)
        holder.push(ele)
      end
    end
    return holder
  end

end



# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable
  def my_each
    for obj in 0...self.length do
      yield(self[obj])
    end
    self
  end
end
