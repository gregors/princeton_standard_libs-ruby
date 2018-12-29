class StdRandom

  # Returns a random integer uniformly in [a, b).
  # Returns a random long integer uniformly in [0, n).
  def self.uniform(a=0, b=nil)
    return rand if a == 0 && b.nil?
    if !a.zero? && b.nil?
      b = a
      a = 0
    end

    throw "Invalid range: [#{a},#{b})" if b <= a

    if b.is_a?(Float)
      return a + rand * (b-a)
    else
      a + uniform_int(b - a)
    end
  end

  # Returns a random boolean from a Bernoulli distribution with success
  # probability p
  def self.bernoulli(p=0.5)
    throw "probability p must be between 0.0 and 1.0: #{p}" if !(p >= 0.0 && p <= 1.0)
    uniform < p
  end

  private

  def self.uniform_int(n)
    throw "argument must be positive: #{n}" if n <= 0

    r = srand
    m = n - 1

    # power of two
    return r & m if (n & m) == 0

    # reject over-represented candidates
    u = unsigned_shift(r, 1)
    while u + m - (r = u % n) < 0
      u = unsigned_shift(srand, 1)
    end

    r
  end

  def self.unsigned_shift(val, amt)
    mask = (1 << (32 - amt)) - 1
    (val >> amt) & mask
  end
end
