require 'math'

class EllipticCurve
  # For now we will just use P-192
  # P-192 http://csrc.nist.gov/groups/ST/toolkit/documents/dss/NISTReCur.pdf
  # E = y^2 = x^3 - 3x + b (mod p)
  # self.160bit_input_seed = "3045ae6fc8422f64ed579528d38120eae12196d5"
  # self.output_sha = "0x3099d2bbbfcb2538542dcd5fb078b6ef5f3d6fe2c745de65"
  # self.b = "0x64210519e59c80e70fa7e9ab72243049feb8deecc146b9b1".hex
  # self.primitive_element = Point.new("0x188da80eb03090f67cbf20eb43a18800f4ff0afd82ff1012".hex,
  #                             "0x07192b95ffc8da78631011ed6b24cdd573f977a11e794811".hex)
  # self.mod = 6277101735386680763835789423207666416083908700390324961279
  #  self.order = 6277101735386680763835789423176059013767194773182842284081
  attr_accessor :a, :b, :base_point, :mod, :order

  def initialize(a, b, mod, order, primitive_element)
    self.a = a
    self.b = b
    self.mod = mod
    self.order = order
    primitive_element = primitive_element
  end


  def add(point1, point2)
    if point1.x != point2.x
      m = (point2.y - point1.y).modulo(mod) * Math.multiplicative_inverse((point2.x - point1.x).modulo(mod), mod)
      x = m.modulo(mod) * m.modulo(mod) - point1.x - point2.x
      y = m.modulo(mod) * ( point1.x - x ).modulo(mod) - point1.y
    else
      m = ((3 * point1.x * point1.x).modulo(mod) + a).modulo(mod) * Math.multiplicative_inverse((2 * point1.y).modulo(mod), mod)
      x = (m * m).modulo(mod) - (2 * point1.x).modulo(mod)
      y = (m * (point1.x - x)).modulo(mod) - point1.y
    end
    Point.new(x.modulo(mod), y.modulo(mod))
  end

  def include?(point)
    left = (point.y * point.y).modulo(mod)
    right = ((point.x * point.x * point.x).modulo(mod) + ((a * point.x).modulo(mod)+ b).modulo(mod)).modulo(mod)
    left == right
  end

end
