class AddTeamToBets < ActiveRecord::Migration[5.1]
  def change
    add_column :bets, :player_id, :integer
    add_column :bets, :game_id, :integer
    add_column :bets, :team, :string
    add_column :bets, :wager, :integer
  end
end
