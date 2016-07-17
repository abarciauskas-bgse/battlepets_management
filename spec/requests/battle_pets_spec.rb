require 'rails_helper'

RSpec.describe "BattlePets", type: :request do
  describe "GET /battle_pets" do
    it "works! (now write some real specs)" do
      get battle_pets_path
      expect(response).to have_http_status(200)
    end
  end
end
