def sum_pairs(array, value)
  (1...array.size).each do |i|
    (0..i).each do |j|
      return [array[j], array[i]] if array[i] + array[j] == value
    end
  end
  nil
end
p sum_pairs([1,4,6,7,8,9,3,5,6,6,7,8], 10)

Ooutput => [4, 6]
