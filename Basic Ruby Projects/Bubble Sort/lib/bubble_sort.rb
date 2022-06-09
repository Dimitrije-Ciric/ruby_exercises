def bubble_sort!(array)
    return array unless array.instance_of?(Array) and array.length > 1

    length = array.length # length of unsorted partition of array
    while length > 1 do
        new_length = 0
        1.upto(length - 1) do |idx| # index from array [1, length - 1]
            if array[idx - 1] > array[idx] 
                array[idx - 1], array[idx] = array[idx], array[idx - 1]
                new_length = idx
            end
        end
        length = new_length # length shrinks to current length of unsorted partition
    end

    return array
end 

def bubble_sort(array)
    return bubble_sort!(Array.new(array)) if array.instance_of?(Array) and array.length > 1
    return array
end