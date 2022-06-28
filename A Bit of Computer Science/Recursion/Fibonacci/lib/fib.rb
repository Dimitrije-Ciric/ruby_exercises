def fibs(n)
  return [] if n <= 0
  return [0] if n == 1
  return [0, 1] if n == 2

  fib_sequence = Array.new(n)
  
  fib_sequence[0] = 0
  fib_sequence[1] = 1

  idx = 2
  while idx < n
    fib_sequence[idx] = fib_sequence[idx - 1] + fib_sequence[idx - 2]
    idx += 1
  end

  fib_sequence
end

# crazy
# def fibs_rec(n)
#   (n <= 0)? [] : ((n == 1)? [0] : ((n == 2)? [0, 1] : (arr = fibs_rec(n - 1); arr << arr[-2] + arr[-1])))
# end

def fibs_rec(n)
  return [] if n <= 0
  return [0] if n == 1
  return [0, 1] if n == 2

  fibs_n_1 = fibs_rec(n - 1)
  fibs_n_1 << fibs_n_1[-1] + fibs_n_1[-2]
end