require "minitest/autorun"
require_relative  "../lib/math"

describe Math do
  describe "multiplicative_inverse" do
    specify { Math.multiplicative_inverse(11, 26).must_equal 19 }
    specify { Math.multiplicative_inverse(197, 3000).must_equal 533 }
    specify { Math.multiplicative_inverse(8, 13).must_equal 5 }
    specify { proc { Math.multiplicative_inverse(2, 4) }.must_raise ArgumentError }
  end
end