require "minitest/autorun"
require_relative  "../lib/ecc"

describe Ecc do
  let(:ecc) { Ecc.new }

  describe "when asked about blending possibilities" do
    it "won't say no" do
      ecc.private_key.must_equal 100
    end
  end
end