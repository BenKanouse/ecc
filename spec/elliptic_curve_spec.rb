require "minitest/autorun"
require_relative  "../lib/elliptic_curve"
require_relative  "../lib/point"

describe EllipticCurve do

  describe "#add" do
    describe "curve a=2 b=2 mod 17" do
      let(:elliptic_curve) { EllipticCurve.new(2, 2, 17, nil, Point.new(5,1)) }
      points = [
        Point.new(5, 1),
        Point.new(6, 3),
        Point.new(10, 6),
        Point.new(3, 1),
        Point.new(9, 16),
        Point.new(16, 13),
        Point.new(0, 6),
        Point.new(13, 7),
        Point.new(7, 6),
        Point.new(7, 11),
        Point.new(13, 10),
        Point.new(0, 11),
        Point.new(16, 4),
        Point.new(9, 1),
        Point.new(3, 16),
        Point.new(10, 11),
        Point.new(6, 14),
        Point.new(5, 16),
      ]

      (1..17).each do |multiplier|
        describe "#{1 + multiplier}p" do
          points.take(multiplier).zip(points.take(multiplier).reverse).each do |point1, point2|
            it "#{point1.to_s} + #{point2.to_s} should be #{points[multiplier]} which is also #{1 + multiplier}p" do
              elliptic_curve.add(point1, point2).must_equal points[multiplier]
            end
          end
          it "should be a point on the curve" do
            elliptic_curve.include?(points[multiplier]).must_equal true
          end
        end
      end
    end

    describe "3p also known as 2p+p" do
      let(:elliptic_curve) { EllipticCurve.new(3, 8, 13, nil, Point.new(5,1)) }
      specify { elliptic_curve.add(Point.new(9,7), Point.new(1,8)).must_equal Point.new(2,10) }
      specify { elliptic_curve.include?(Point.new(2,10)).must_equal true }
    end

    describe "3p also known as 2p+p" do
      let(:elliptic_curve) { EllipticCurve.new(1, 0, 23, nil, Point.new(5,1)) }
      specify { elliptic_curve.add(Point.new(1,5), Point.new(1,5)).must_equal Point.new(0, 0) }
      specify { elliptic_curve.include?(Point.new(9, 5)).must_equal true }
      specify { elliptic_curve.include?(Point.new(18, 10)).must_equal true }
      specify { elliptic_curve.include?(Point.new(0, 0)).must_equal true }
    end
  end

end
