class BattlePet < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :battlepet_traits

  def trait(name)
    self.battlepet_traits.where(name: name).first.value
  end

  def traits
    self.battlepet_traits
  end

  def slug
    self.name.downcase.gsub(" ", "_")
  end
end
