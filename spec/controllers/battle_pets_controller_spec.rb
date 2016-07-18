require 'rails_helper'

RSpec.describe BattlePetsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # BattlePet. As you add validations to BattlePet, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {name: 'Totoro'} }

  describe "GET #show" do
    it "assigns the requested battle_pet as @battle_pet" do
      battle_pet = BattlePet.create! valid_attributes
      get :show, params: {id: battle_pet.to_param}
      expect(assigns(:battle_pet)).to eq(battle_pet)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new BattlePet" do
        expect {
          post :create, params: {battle_pet: valid_attributes}
        }.to change(BattlePet, :count).by(1)
      end

      it "redirects to the created battle_pet" do
        post :create, params: {battle_pet: valid_attributes}
        expect(response).to be_success
      end

      context 'with specified skills' do
        let(:valid_attributes) do
          {name: 'Totoro', traits: {strength: 80, wit: 1, agility: 9, senses: 5}}
        end

        it "creates a new BattlePet" do
          expect {
            post :create, params: {battle_pet: valid_attributes}
          }.to change(BattlePet, :count).by(1)
        end

        it "creates a BattlePet with the specified params" do
          post :create, params: {battle_pet: valid_attributes}
          expect(BattlePet.last.trait('strength')).to eq(valid_attributes[:traits][:strength])
        end
      end
    end
  end
end
