class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :Name
      t.string :Website
      t.string :Address
      t.float :Size
      t.int :Founded
      t.string :Revenue
      t.string :Synopsis

      t.timestamps
    end
  end
end
