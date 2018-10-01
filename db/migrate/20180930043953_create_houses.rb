class CreateHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :houses do |t|
      t.references :company, foreign_key: true
      t.string :location
      t.integer :square_footage
      t.integer :year
      t.string :style
      t.integer :price
      t.integer :floors
      t.boolean :basement
      t.string :owner
      t.string :contact

      t.timestamps
    end
  end
end
