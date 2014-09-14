require_relative '../spec_helper.rb'

describe BurritoTracker::Burrito do
  let(:burrito1) { BurritoTracker::Burrito.new(type: "Bean") }

  describe "#initialize" do
    it "should make a new burrito" do
      expect(burrito1).to be_a(BurritoTracker::Burrito)
      expect(burrito1.type).to eq("Bean")
    end
  end


end