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

  # * Returns a random real number from a standard Gaussian distribution.
  def self.gaussian(mu=nil, sigma=nil)
    return mu + sigma * gaussian if mu && sigma

    #x use the polar form of the Box-Muller transform
    r, x, y = nil
    loop do
      x = uniform(-1.0, 1.0)
      y = uniform(-1.0, 1.0)
      r = (x*x) + (y*y)
      break unless r >= 1 || r == 0
    end

    # Remark:  y * Math.sqrt(-2 * Math.log(r) / r)
    # is an independent random gaussian
    input = -2 * (Math.log(r) / r)
    x * Math.sqrt(input)
  end

  #  Returns a random integer from a geometric distribution with success
  #  probability p.
  #  The integer represents the number of independent trials
  #  before the first success.
  #
  #  throws IllegalArgumentException unless p >= 0.0 and p <= 1.0
  def self.geometric(p)
    throw "probability p must be greater than 0: #{p}" if !(p >= 0)
    throw "probability p must not be larger than 1: #{p}" if !(p <= 1.0)

    # using algorithm given by Knuth
    (Math.log(uniform) / Math.log(1.0 - p)).ceil
  end

  # Returns a random integer from a Poisson distribution with mean & lambda.
  #
  # param  lambda the mean of the Poisson distribution
  # return a random integer from a Poisson distribution with mean lambda
  # throws Exception unless lambda > 0.0 and not infinite

  def self.poisson(lmbda)
    throw "lambda must be positive: #{lmbda}" if !(lmbda > 0.0)
    throw "lambda must not be infinite: #{lmbda}" if lmbda == Float::INFINITY
    # using algorithm given by Knuth
    # see http://en.wikipedia.org/wiki/Poisson_distribution
    k = 0
    p = 1.0
    expLambda = Math.exp(-lmbda)
    loop do
      k += 1
      p *= uniform
      break unless p >= expLambda
    end
    k-1
  end

  # Returns a random real number from a Pareto distribution with
  # shape parameter alpha
  #
  # param  alpha shape parameter
  # return a random real number from a Pareto distribution with shape
  #         parameter alpha
  # throws Exception unless alpha > 0.0

  def self.pareto(alpha=nil)
    return pareto(1.0) if alpha.nil?

    throw "alpha must be positive: #{alpha}" if !(alpha > 0.0)
    ((1 - uniform) ** (-1.0/alpha)) - 1.0
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
