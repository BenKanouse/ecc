require "minitest/autorun"
require_relative  "../lib/key_generator"

describe KeyGenerator do
  let(:elliptic_curve) { c = Struct.new(:order); c.new(5) }
  let(:key_generator) { KeyGenerator.new(elliptic_curve) }
  let(:order) { 10 }


  describe "#private_key" do
      Array(0..10).each do |rand|
      it "Should generate an number between 1 and elliptic_curve#order" do
        Kernel.stub(:rand, rand) do
          key_generator.private_key.must_equal rand + 2
        end
      end
    end
  end

end