class CreateBattlepetTraits < ActiveRecord::Migration[5.0]
  def change
    create_table :battlepet_traits do |t|
      t.string :name, null: false
      t.integer :value, default: 0
      t.references :battle_pet, foreign_key: true

      t.timestamps
    end
  end
end
