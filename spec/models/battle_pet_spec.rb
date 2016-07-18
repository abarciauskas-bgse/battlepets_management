require 'rails_helper'
require 'spec_helper'

describe BattlePet, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  describe 'traits' do
    let(:totoro) { BattlePet.create!(name: 'Totoro') }
    let(:trait) do
      BattlepetTrait.create!(name: 'strength', value: DEFAULT_TRAITS['strength'], battle_pet: totoro)
    end

    it 'returns the trait value' do
      trait
      expect(totoro.trait('strength')).to eq(DEFAULT_TRAITS['strength'])
    end
  end

  describe 'slug' do
    let(:totoro) { BattlePet.create!(name: 'My Pet Totoro') }

    it 'is the name downcased with spaces removed' do
      expect(totoro.slug).to eq('my_pet_totoro')
    end
  end
end
