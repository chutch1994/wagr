class AddNameToPlayers < ActiveRecord::Migration[5.1]
  def change
		add_column :players, :user_id, :integer
		add_column :players, :name, :string
		add_column :players, :money, :integer, :default => 50000
  end
end
