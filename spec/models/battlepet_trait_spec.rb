require 'rails_helper'
require 'spec_helper'

describe BattlepetTrait, type: :model do
  let(:totoro) { BattlePet.create!(name: 'Totoro') }

  describe 'name' do
    context 'when null' do
      let(:battlepet_trait) { BattlepetTrait.new(battle_pet: totoro) }

      it 'is invalid' do
        expect(battlepet_trait).to be_invalid
      end
    end
  end

  describe 'attributes limit' do
    let(:trait) do
      BattlepetTrait.new(name: 'strength', value: ATTRIBUTES_LIMIT+1, battle_pet: totoro)
    end

    it 'limits the sum of attributes' do
      expect{ trait.save! }.to raise_error(
        ActiveRecord::RecordInvalid, "Validation failed: Attributes must sum to less than #{ATTRIBUTES_LIMIT}"
      )
    end

    it 'does not save the new attribute' do
      expect{ begin trait.save! rescue nil end }.not_to change(BattlepetTrait, :count)
    end
  end  
end
