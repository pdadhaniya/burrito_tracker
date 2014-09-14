require_relative '../spec_helper.rb'

describe BurritoTracker::Repositories::PersonsRepo do
  let(:person1) { BurritoTracker::Person.new(first_name: "Parag") }

  before(:each) do
    # BurritoTracker.persons_burritos_restaurants_repo.drop_tables
    # BurritoTracker.restaurants_repo.drop_tables
    # BurritoTracker.burritos_repo.drop_tables
    BurritoTracker.persons_repo.drop_tables
    BurritoTracker.persons_repo.create_tables
    # BurritoTracker.burritos_repo.create_tables
    # BurritoTracker.restaurants_repo.create_tables
    # BurritoTracker.persons_burritos_restaurants_repo.create_tables
  end

  describe "#save_person" do
    it "should save a person to the persons table" do
      result = BurritoTracker.persons_repo.save_person(person1)
      expect(result["first_name"]).to eq("Parag")
      expect(result["id"]).to eq("1")
      expect(person1.id).to eq(1)
    end
  end

  describe "#delete_person" do
    it "should remove a person from the persons table" do
      BurritoTracker.persons_repo.save_person(person1)
      result = BurritoTracker.persons_repo.delete_person(person1)
      expect(result.entries).to eq([])
    end
  end


end