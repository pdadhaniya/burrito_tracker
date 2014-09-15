require_relative '../spec_helper.rb'

describe BurritoTracker::Repositories::BurritosRepo do
  let(:burrito1) { BurritoTracker::Burrito.new(type: "Bean") }

  before(:each) do
    # BurritoTracker.restaurants_repo.drop_tables
    BurritoTracker.burritos_repo.drop_tables
    BurritoTracker.persons_repo.drop_tables
    BurritoTracker.persons_repo.create_tables
    BurritoTracker.burritos_repo.create_tables
    # BurritoTracker.restaurants_repo.create_tables
  end

  describe "#save_burrito" do
    xit "should save a burrito to the burritos table" do
      result = BurritoTracker.burritos_repo.save_burrito(burrito1)
      expect(result["type"]).to eq("Bean")
      expect(result["id"]).to eq("1")
      expect(burrito1.id).to eq(1)
    end

    xit "should update a burrito's type if it is already in the burritos table" do
      BurritoTracker.burritos_repo.save_burrito(burrito1)
      burrito1.type = "Veggie"
      result = BurritoTracker.burritos_repo.save_burrito(burrito1)
      expect(result["type"]).to eq("Veggie")
      expect(result["id"]).to eq("1")
    end
  end

  describe "#delete_burrito" do
    xit "should remove a burrito from the burritos table" do
      BurritoTracker.burritos_repo.save_burrito(burrito1)
      result = BurritoTracker.burritos_repo.delete_burrito(burrito1)
      expect(result.entries).to eq([])
    end
  end

  describe "#get_burrito" do
    xit "should return a burrito based on the requested id" do
      BurritoTracker.burritos_repo.save_burrito(burrito1)
      result = BurritoTracker.burritos_repo.get_burrito(1)
      expect(result["type"]).to eq("Bean")
      expect(result["id"]).to eq("1")
    end
  end

  describe "#get_all_burritos" do
    xit "should return all burritos from the burritos table" do
      burrito2 = BurritoTracker::Burrito.new(type: "Veggie")
      BurritoTracker.burritos_repo.save_burrito(burrito1)
      BurritoTracker.burritos_repo.save_burrito(burrito2)
      result = BurritoTracker.burritos_repo.get_all_burritos
      expect(result[0]["id"]).to eq("1")
      expect(result[0]["type"]).to eq("Bean")
      expect(result[1]["id"]).to eq("2")
      expect(result[1]["type"]).to eq("Veggie")
    end
  end






end