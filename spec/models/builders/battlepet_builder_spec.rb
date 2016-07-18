require 'rails_helper'
require 'spec_helper'

describe BattlepetBuilder, type: :model do
  describe 'initialize' do
    let(:builder) { BattlepetBuilder.new(name: 'Totoro') }
    it 'creates a battlepet' do
      expect { builder }.to change(BattlePet, :count).by(1)
    end

    it 'creates the default battlepet traits' do
      expect { builder }.to change(BattlepetTrait, :count).by(DEFAULT_TRAITS.size())
    end

    it 'associates traits with the new battlepet' do
      builder
      expect(BattlePet.last.traits.size()).to eq(DEFAULT_TRAITS.size())
    end
  end
end
