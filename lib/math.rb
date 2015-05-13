module Math
  # multiplicative_inverse method solves for x in the equation:
  # a*x = 1 mod(m)
  # Method: By definition m is a divisor of a*x - 1 which means
  # that a*x - 1 = q * m where q is an integer. Solving for 1 we
  # can see that this equation is equivalent to a*x - q*m = 1 which
  # fits the form of the "Extended Euclidean Algorithm":
  # a * x + b * y = gcd(a,b)
  # where the gcd(a,b) == 1
  def self.multiplicative_inverse(a, m)
    t = 0
    new_t = 1
    remainder = m
    new_remainder = a
    while new_remainder != 0
      (quotient, new_remainder), remainder = remainder.divmod(new_remainder), new_remainder
      t, new_t = new_t, t - quotient * new_t
    end
    raise ArgumentError.new("'a' is not invertible") unless remainder == 1
    (t < 0) ? (t + m) : t
  end
end