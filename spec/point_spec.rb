require "minitest/autorun"
require_relative  "../lib/point"

describe Point do
  let(:point) { Point.new(5, 2) }

  specify { point.x.must_equal 5 }
  specify { point.y.must_equal 2 }

end