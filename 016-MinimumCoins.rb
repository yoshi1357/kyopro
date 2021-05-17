N=gets.to_i
A,B,C=gets.split.map(&:to_i)

INF=Float::INFINITY

_max=9999
_min=INF
[*0.._max].each{|i|
  [*0..(_max-i)].each{|j|
    v = N - (A  * i + B * j)
    k = ( N - (A  * i + B * j) ) / C

    cnt=i+j+k
    next if v < 0 || v % C != 0

    _min=[_min, cnt].min
  }
}

puts _min
