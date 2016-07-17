require "rails_helper"

RSpec.describe BattlePetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/battle_pets").to route_to("battle_pets#index")
    end

    it "routes to #new" do
      expect(:get => "/battle_pets/new").to route_to("battle_pets#new")
    end

    it "routes to #show" do
      expect(:get => "/battle_pets/1").to route_to("battle_pets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/battle_pets/1/edit").to route_to("battle_pets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/battle_pets").to route_to("battle_pets#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/battle_pets/1").to route_to("battle_pets#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/battle_pets/1").to route_to("battle_pets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/battle_pets/1").to route_to("battle_pets#destroy", :id => "1")
    end

  end
end
