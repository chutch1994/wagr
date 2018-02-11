class AddResultsToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :away_team_score, :integer
    add_column :games, :home_team_score, :integer
    add_column :games, :cover_team, :string
  end
end
