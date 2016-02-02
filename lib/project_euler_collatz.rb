def even_next(n)
  even= n/2
  return even
end

def odd_next(n)
  odd=n*3+1
  return odd
end

def next_value(n)
  if n%2==0
    even_next(n)
  else
    odd_next(n)
  end
end

def collatz(n)
  number=n.to_i
  collatz_array=Array.new
  collatz_array<<number
  until number==1
    number=next_value(number)
    collatz_array<<number
  end
  return collatz_array
end

def longest_collatz
  longest_chain = 1
  longest_starting = 1
  starting_num = 1
  cache = {1 => 1}
  while starting_num < 1000000
    n = starting_num
    chain = 0
    while (n != 1) && (n >= starting_num)
      if n.even?
        n = n/2
      else
        n = 3*n + 1
      end
      chain += 1
    end
    chain += cache[n]
    if chain > longest_chain
      longest_chain = chain
      longest_starting = starting_num
    end
    cache[starting_num] = chain
    starting_num += 1
  end
  return longest_starting
end