require_relative '../spec_helper.rb'

describe BurritoTracker::Restaurant do
  let(:restaurant1) { BurritoTracker::Restaurant.new(name: "Papalote") }

  describe "#initialize" do
    it "should make a new restaurant" do
      expect(restaurant1).to be_a(BurritoTracker::Restaurant)
      expect(restaurant1.name).to eq("Papalote")
    end
  end



end