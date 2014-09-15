require_relative '../spec_helper.rb'

describe BurritoTracker::Repositories::BurritosRepo do
  let(:burrito1) { BurritoTracker::Burrito.new(type: "Bean") }

  before(:each) do
    BurritoTracker.restaurants_repo.drop_tables
    BurritoTracker.burritos_repo.drop_tables
    BurritoTracker.persons_repo.drop_tables
    BurritoTracker.persons_repo.create_tables
    BurritoTracker.burritos_repo.create_tables
    BurritoTracker.restaurants_repo.create_tables
  end

  describe "#save_burrito" do
    it "should save a burrito to the burritos table" do
      result = BurritoTracker.burritos_repo.save_burrito(burrito1)
      expect(result["type"]).to eq("Bean")
      expect(result["id"]).to eq("1")
      expect(burrito1.id).to eq(1)
    end
  end






end