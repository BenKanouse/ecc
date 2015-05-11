class KeyGenerator
  attr_accessor :elliptic_curve
  def initialize(elliptic_curve)
    self.elliptic_curve = elliptic_curve
  end

  def private_key
    @private_key ||= 2 + Kernel.rand(elliptic_curve.order - 2)
  end

  def public_key
    # elliptic_curve_origin * private key
  end
end