require_relative '../spec_helper.rb'

describe BurritoTracker::Person do
  let(:person1) { BurritoTracker::Person.new(first_name: "Parag") }


  describe "#initialize" do
    it "should make a new person with a name" do
      expect(person1).to be_a(BurritoTracker::Person)
      expect(person1.first_name).to eq("Parag")
    end
  end






end