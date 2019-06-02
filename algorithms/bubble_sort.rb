def bubble_sort(array)
  n = array.length
  p n
  for i in 0..n - 1
    swap = false
    for j in 0..n - 2
      if array[j] > array[j+1]
        array[j], array[ j+ 1] = array[ j+ 1], array[j]
        swap = true
      end
    end
    break if swap == false
  end
  array
end

p bubble_sort([20, 12, 4, 5, 78, 92, 23, 1])
