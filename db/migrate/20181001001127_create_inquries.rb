class CreateInquries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquries do |t|
      t.references :pbuyer
      t.string :subject
      t.string :content
      t.string :reply

      t.timestamps
    end
  end
end
