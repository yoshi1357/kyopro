# log2(a) < blog2(c) <=> a < c ** b

a,b,c=gets.split.map(&:to_i)

res=""
a < c ** b ? res = "Yes" : res = "No"

puts res