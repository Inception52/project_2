class AddSwitchToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :switch, :boolean, default: true
  end
end
