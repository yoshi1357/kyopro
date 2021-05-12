N=gets.to_i

0.upto(2 ** N - 1) do |i|
  bit = i.to_s(2).rjust(N,"0").split('').map(&:to_i)
  
  if bit.count(1) == bit.count(0)
    s=0
    flag=false
    [*0...N].each{|i|
      if bit[i] == 0
        s += 1
      else
        s -= 1
      end
      
      if s < 0
        flag=true
        break
      end
    }
    
    if flag == false
      bit.map!{ |b| b==0 ? "(" : ")" }
      puts bit.join("")
    end
  end
end


