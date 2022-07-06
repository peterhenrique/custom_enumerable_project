module Enumerable
  # Your code goes here
  def my_each
    for i in self
      yield i
    end
  end

  def my_each_with_index
    i = 0
    for k in self
      yield k, i
      i += 1
    end
  end

  def my_select
    retorno = []
    my_each { |el| retorno << el if yield(el) }
    false
  end

  def my_all?
    my_each { |el| return true if yield(el) }
    false
  end

  def my_any?
    my_each { |el| return true if yield(el) }
    false
  end

  def my_none?
    my_each { |el| return false if yield(el) }
    true
  end

  def my_count
    procing = proc {
      i = 0
      my_each { |el| i += 1 if yield(el) }
      return i
    }
    if block_given?
      procing.call
    else
      length
    end
  end
end


#tes
# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable
  # Define my_each here
end