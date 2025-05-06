# These answers are copied and pasted from my first attempt, because I accidentally
# completed the project on the "non-forked" repo.

module Enumerable
  # Your code goes here
  def my_all?
    self.my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    self.my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_count
    unless block_given?
      return self.size
    end
    tally = 0
    self.my_each do |elem|
      if yield(elem)
        tally +=1
      end
    end
    tally
  end

  def my_each_with_index
    if block_given?
      index = 0
      self.my_each do |elem|
        yield(elem, index)
        index += 1
      end
    else
      self
    end
  end

  def my_inject(init)
    result = init
    self.my_each { |elem| result = yield(result, elem) }
    result
  end

  def my_map
    result = []
    if block_given?
      self.each { |elem| result << yield(elem) }
    end
    result
  end

  def my_none?
    self.my_each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_select
    result = []
    self.my_each { |elem| result << elem if yield(elem) }
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |elem|
      yield(elem)
    end
    self
  end
end