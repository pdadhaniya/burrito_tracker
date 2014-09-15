require_relative "../spec_helper.rb"

describe BurritoTracker::Repositories::RestaurantsRepo do
  let(:restaurant1) { BurritoTracker::Restaurant.new(name: "Papalote") }


  before(:each) do
      BurritoTracker.restaurants_repo.drop_tables
      BurritoTracker.burritos_repo.drop_tables
      BurritoTracker.persons_repo.drop_tables
      BurritoTracker.persons_repo.create_tables
      BurritoTracker.burritos_repo.create_tables
      BurritoTracker.restaurants_repo.create_tables
  end

  describe "#save_restaurant" do
    it "should save a restaurant to the restaurants table" do
      result = BurritoTracker.restaurants_repo.save_restaurant(restaurant1)
      expect(result["name"]).to eq("Papalote")
      expect(result["id"]).to eq("1")
      expect(restaurant1.id).to eq(1)
    end

    it "should update a restaurant's name if it is already in the restaurants table" do
      BurritoTracker.restaurants_repo.save_restaurant(restaurant1)
      restaurant1.name = "Chipotle"
      result = BurritoTracker.restaurants_repo.save_restaurant(restaurant1)
      expect(result["name"]).to eq("Chipotle")
      expect(result["id"]).to eq("1")
    end    
  end

  describe "#delete_restaurant" do
    it "should remove a restaurant from the restaurants table" do
      BurritoTracker.restaurants_repo.save_restaurant(restaurant1)
      result = BurritoTracker.restaurants_repo.delete_restaurant(restaurant1)
      expect(result.entries).to eq([])
    end
  end

  describe "#get_restaurant" do
    it "should return a restaurant based on the requested id" do
      BurritoTracker.restaurants_repo.save_restaurant(restaurant1)
      result = BurritoTracker.restaurants_repo.get_restaurant(1)
      expect(result["name"]).to eq("Papalote")
      expect(result["id"]).to eq("1")
    end
  end

  describe "#get_all_restaurants" do
    it "should return all restaurants from the restaurants table" do
      restaurant2 = BurritoTracker::Restaurant.new(name: "Chipotle")
      BurritoTracker.restaurants_repo.save_restaurant(restaurant1)
      BurritoTracker.restaurants_repo.save_restaurant(restaurant2)
      result = BurritoTracker.restaurants_repo.get_all_restaurants
      expect(result[0]["id"]).to eq("1")
      expect(result[0]["name"]).to eq("Papalote")
      expect(result[1]["id"]).to eq("2")
      expect(result[1]["name"]).to eq("Chipotle")
    end
  end

end