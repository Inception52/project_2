class CreatePbuyers < ActiveRecord::Migration[5.2]
  def change
    create_table :pbuyers do |t|
      t.references :house
      t.references :user

      t.timestamps
    end
  end
end
