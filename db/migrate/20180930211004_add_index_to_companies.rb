class AddIndexToCompanies < ActiveRecord::Migration[5.2]
  def change
	add_index :companies, :Website, unique: true
  end
end
