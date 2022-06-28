module MergeSort
  LESS_CMP = (lambda { |left_operand, right_operand| left_operand < right_operand }).freeze

  def MergeSort.sort(array, cmp = LESS_CMP)
    return array if array.count <= 1

    mid = array.count / 2
    left_array = array[0...mid]
    right_array = array[mid...array.count]

    if array.count > 2
      left_array = sort(left_array, cmp)
      right_array = sort(right_array, cmp)
    end 

    merge(left_array, right_array, cmp)
  end

  def MergeSort.merge(array1, array2, cmp = LESS_CMP)
    merged = Array.new(array1.count + array2.count)

    idx = idx1 = idx2 = 0
    while idx1 < array1.count && idx2 < array2.count
      if cmp.call(array1[idx1], array2[idx2])
        merged[idx] = array1[idx1]
        idx1 += 1
      else
        merged[idx] = array2[idx2]
        idx2 += 1
      end

      idx += 1
    end

    while idx1 < array1.count
      merged[idx] = array1[idx1]
      idx += 1; idx1 += 1
    end

    while idx2 < array2.count
      merged[idx] = array2[idx2]
      idx += 1; idx2 += 1
    end

    merged
  end
end