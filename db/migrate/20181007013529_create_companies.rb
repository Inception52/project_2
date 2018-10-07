class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.references :house, foreign_key: true
      t.string :Name
      t.string :Website
      t.string :Address
      t.float :Size
      t.integer :Founded
      t.string :Revenue
      t.text :Synopsis

      t.timestamps
    end
  end
end
