input = readlines(chomp: true).map{|x| x.split(' ').map(&:to_i)}

M,N = input.shift
con = input.pop
lights = input

swichs = []
0.upto(2 ** M - 1) do |i|
  arr = i.to_s(2).rjust(M,"0").split('').map(&:to_i)
  swichs << arr
end

cnt = 0
swichs.each do |swich|
  results = []
  lights.each.with_index do |light, i|
    light_cons = light[1..-1]
    swich_tmp = []

    light_cons.each do |light_con|
      swich_tmp.push(swich[light_con - 1])
    end

    if con[i] == 0
      if swich_tmp.sum % 2 == 0
        results << true
      else
        results << false
      end
    else
      if swich_tmp.sum % 2 == 1
        results << true
      else
        results << false
      end
    end

  end
  cnt += 1 if results.count(true) == results.size
end

puts cnt