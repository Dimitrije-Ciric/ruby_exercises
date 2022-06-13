# frozen_string_literal: true

def bubble_sort!(array)
  length = array.length # length of unsorted partition of array
  while length > 1
    new_length = 0
    1.upto(length - 1) do |idx| # index from array [1, length - 1]
      if array[idx - 1] > array[idx]
        array[idx - 1], array[idx] = array[idx], array[idx - 1]
        new_length = idx
      end
    end
    length = new_length # length shrinks to current length of unsorted partition
  end

  array
end

def bubble_sort(array)
  bubble_sort!(array.dup)
end
