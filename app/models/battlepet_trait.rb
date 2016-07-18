class BattlepetTrait < ApplicationRecord
  extend ActiveModel::Naming
  belongs_to :battle_pet
  validates_presence_of :name
  validate :attribute_limit

  def self.initialize(args = {})
    @errors = ActiveModel::Errors.new(self)
  end

  def attribute_limit
    attributes_sum = self.battle_pet.battlepet_traits.inject(0) do |sum, trait|
      value = trait.value ||= 0
      sum + value
    end
    attributes_sum += self.value || 0
    unless attributes_sum <= ATTRIBUTES_LIMIT
      self.errors.add(:attributes, "must sum to less than #{ATTRIBUTES_LIMIT}")
    end
  end  
end
