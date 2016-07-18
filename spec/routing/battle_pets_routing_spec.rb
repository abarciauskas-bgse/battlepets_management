require "rails_helper"

RSpec.describe BattlePetsController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(:get => "/battle_pets/1").to route_to("battle_pets#show", :id => "1")
    end

    it "routes to #show" do
      expect(:get => "/battle_pets/luna").to route_to("battle_pets#show", :id => "luna")
    end

    it "routes to #create" do
      expect(:post => "/battle_pets").to route_to("battle_pets#create")
    end
  end
end
