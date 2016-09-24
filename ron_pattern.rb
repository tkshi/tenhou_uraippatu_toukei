# # -*- coding: utf-8 -*-

numbers = ["自分","下家","対面"]
numbers.permutation(2) {|a, b|
  # printf("(%d, %d) ", a, b)
  puts "#{a} <= #{b}"
}
puts ""
