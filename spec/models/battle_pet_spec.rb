require 'rails_helper'
require 'spec_helper'

describe BattlePet, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  describe 'attributes' do
    let(:totoro) { BattlePet.create!(name: 'Totoro') }

    context 'when created with no attributes' do
      it 'has default attributes' do
        expect(totoro.strength).to eq(STRENGTH_DEFAULT)
        expect(totoro.wit).to eq(WIT_DEFAULT)
        expect(totoro.agility).to eq(AGILITY_DEFAULT)
        expect(totoro.senses).to eq(SENSES_DEFAULT)
      end

      context 'when created with custom attributes' do
        let(:attributes) { {strength: 10, wit: 0, agility: 50, senses: 40} }
        let(:luna) { BattlePet.create!(attributes.merge(name: 'Luna')) }

        it 'has the custom attributes' do
          expect(luna.strength).to eq(attributes[:strength])
          expect(luna.wit).to eq(attributes[:wit])
          expect(luna.agility).to eq(attributes[:agility])
          expect(luna.senses).to eq(attributes[:senses])
        end
      end

      describe 'attributes limit' do
        let(:attributes) { {strength: 10, wit: 10, agility: 50, senses: 40} }

        it 'limits the sum of attributes' do
          expect{ BattlePet.create!(attributes.merge(name: 'Luna')) }.to raise_error(
            ActiveRecord::RecordInvalid, "Validation failed: Attributes must sum to less than #{ATTRIBUTES_LIMIT}"
          )
        end
      end
    end
  end

  describe 'slug' do
    let(:totoro) { BattlePet.create!(name: 'My Pet Totoro') }

    it 'is the name downcased with spaces removed' do
      expect(totoro.slug).to eq('my_pet_totoro')
    end
  end
end
