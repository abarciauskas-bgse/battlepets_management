class BattlePetSerializer < ActiveModel::Serializer
  attributes :name, :serialized_traits

  def serialized_traits
    self.object.traits.map do |trait|
      BattlepetTraitSerializer.new(trait)
    end
  end
end
