T=gets.to_f
L,X,Y=gets.split.map(&:to_f)
Q=gets.to_i

Q.times{
  t=gets.to_f
  sy = -L/2 * (Math.sin(Math::PI * (t/T)))
  sz = L/2-L/2 * (Math.cos(Math::PI * (t/T)))

  # p Math.sin(Math::PI * (t/T))

  p [sy,sz]

  a=Math.sqrt(X**2+(sy-Y)**2)
  b=sz

  ans=Math.atan2(b,a) * (180.0 / Math::PI)

  puts ans
}