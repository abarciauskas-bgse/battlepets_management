class BattlePet < ApplicationRecord
  extend ActiveModel::Naming
  validates :name, presence: true, uniqueness: true
  before_save :default_values
  validate :attribute_limit

  def self.initialize
    @errors = ActiveModel::Errors.new(self)
  end

  def default_values
    self.wit ||= WIT_DEFAULT
    self.strength ||= STRENGTH_DEFAULT
    self.agility ||= AGILITY_DEFAULT
    self.senses ||= STRENGTH_DEFAULT
  end

  def attribute_limit
    attributes_sum = attributes_as_array.inject(0) do |sum, x|
      x ||= 0
      sum + x
    end
    unless attributes_sum <= ATTRIBUTES_LIMIT
      errors.add(:attributes, "must sum to less than #{ATTRIBUTES_LIMIT}")
    end
  end

  def attributes_as_array
    [self.wit, self.strength, self.agility, self.senses]
  end
end
