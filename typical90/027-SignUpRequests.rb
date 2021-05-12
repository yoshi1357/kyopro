N=gets.to_i
hash={}
N.times{|i|
  name=gets.chomp
  if hash.has_key?(name) == false
    hash[name]=i+1
    puts i+1
  end
}