class CreateArmors < ActiveRecord::Migration[5.2]
  def change
    create_table :armors do |t|
      t.string :name
      t.integer :cell_slot_type
      t.integer :base_armor
      t.integer :elemental_resistance_amount 
      t.integer :elemental_weakness_amount
      t.integer :perk_amount
      t.belongs_to :elemental_resistance
      t.belongs_to :elemental_weakness
      t.belongs_to :perk
      t.timestamps
    end
  end
end
