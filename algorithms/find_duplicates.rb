# frozen_string_literal: true

# find duplicates form array is 1st approach.
def find_duplicates(list)
  count = {}
  duplicates = []
  list.each do |i|
    if count[i]
      duplicates << i
    else
      count[i] = 1
    end
  end
  duplicates
end
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 2, 5, 9, 1]
p find_duplicates(a)
