N=gets.to_i
students=N.times.map{gets.split.map(&:to_i)}
Q=gets.to_i

s1=[0]
s2=[0]

students.each{|c, score|
  if c == 1
    s1.push(s1.last + score)
    s2.push(s2.last)
  else
    s2.push(s2.last + score)
    s1.push(s1.last)
  end
}

Q.times{
  s, e = gets.split.map(&:to_i)
  score1=s1[e] - s1[s-1]
  score2=s2[e] - s2[s-1]

  puts [score1, score2].join(" ")
}