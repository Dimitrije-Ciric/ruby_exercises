# frozen_string_literal: true

module Enumerable
  def my_each_with_index(*args)
    return to_enum(:my_each_with_index, args) unless block_given?

    index = 0
    my_each do |element|
      yield element, index
      index += 1
    end

    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    selected_elements = []

    my_each do |element|
      selected_elements << element if yield element
    end

    selected_elements
  end

  def my_all?(pattern = nil)
    check = if pattern
              ->(element) { pattern === element }
            elsif block_given?
              ->(element) { yield element }
            else
              ->(element) { true }
            end

    my_each { |element| return false unless check.call(element) }

    true
  end

  def my_any?(pattern = nil)
    check = if pattern
              ->(element) { pattern === element }
            elsif block_given?
              ->(element) { yield element }
            else
              ->(element) { true }
            end

    my_each { |element| return true if check.call(element) }

    false
  end

  def my_none?(pattern = nil)
    check = if pattern
              ->(element) { pattern === element }
            elsif block_given?
              ->(element) { yield element }
            else
              ->(element) { true }
            end

    my_each { |element| return false if check.call(element) }

    true
  end

  def Enumerable.wrong_number_of_arguments(args_count, minimum, maximum)
    error_message = if minimum == maximum
                      "wrong number of arguments (given #{args_count}, expected #{minimum})"
                    else
                      "wrong number of arguments (given #{args_count}, expected #{minimum}..#{maximum})"
                    end
    raise ArgumentError.new(error_message)
  end

  def Enumerable.check_number_of_arguments(args_count, minimum, maximum)
    unless args_count.between?(minimum, maximum)
      wrong_number_of_arguments(args_count, minimum, maximum)
    end
  end

  def my_count(*args)
    Enumerable.check_number_of_arguments(args.count, 0, 1)
    
    check = if args.count == 1
              ->(element) { element == args[0] }
            elsif block_given?
              ->(element) { yield element }
            else
              ->(element) { true }
            end

    count = 0
    my_each { |element| count += 1 if check.call(element) }
      
    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    mapped_elements = []
    my_each { |element| mapped_elements << yield(element) }

    mapped_elements
  end

  def Enumerable.symbol_or_string?(object)
    object.instance_of?(Symbol) || object.instance_of?(String) 
  end

  def my_inject(*args)
    Enumerable.check_number_of_arguments(args.count, 0, 2)

    case args
    in [symbol] if Enumerable.symbol_or_string?(symbol) 
      operator_sym = symbol.to_sym
    in [initial_operand]
      initial = initial_operand
    in [initial_operand, symbol] if Enumerable.symbol_or_string?(symbol) 
      initial = initial_operand
      operator_sym = symbol.to_sym 
    in [initial_operand, symbol] # symbol isn't Symbol or String class instance
      raise(TypeError, "#{symbol} is not a symbol nor a string")
    end

    operator =  if operator_sym
                  operator_sym.to_proc
                elsif block_given?
                  ->(left_operand, right_operand) { yield left_operand, right_operand }
                else
                  ->(left_operand, right_operand) { true }
                end

    reduced = initial or first

    my_each_with_index do |element, idx|
      next if initial.nil? && idx.zero?
      reduced = operator.call(reduced, element)
    end

    reduced
  end
end

class Array
  def my_each
    return to_enum(:my_each) unless block_given?

    idx = 0
    while idx < count
      yield self[idx]
      idx += 1
    end

    self
  end
end
