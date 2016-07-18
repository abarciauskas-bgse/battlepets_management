class BattlepetBuilder
  def initialize(args = {})
    pet = BattlePet.create!(name: args[:name])
    @battle_pet = pet
    pet_traits = args[:traits] || DEFAULT_TRAITS
    pet_traits.each do |trait_name, trait_value|
      trait_object = BattlepetTrait.create!(name: trait_name, value: trait_value, battle_pet: pet)
    end 
  end

  def battle_pet
    @battle_pet
  end
end
