A,B,C=gets.split.map(&:to_i)

G=A.gcd(B.gcd(C))

cnt=(A/G-1)+(B/G-1)+(C/G-1)

puts cnt