H,W=gets.split.map(&:to_i)

res=0
if H == 1 || W == 1
  res=H*W
else
  res=(H-1)/2 * (W-1)/2
end

puts res