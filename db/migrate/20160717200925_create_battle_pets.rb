class CreateBattlePets < ActiveRecord::Migration[5.0]
  def change
    create_table :battle_pets do |t|
      t.string :name
      t.integer :wit
      t.integer :strength
      t.integer :agility
      t.integer :senses

      t.timestamps
    end
    add_index :battle_pets, :name, unique: true
  end
end
