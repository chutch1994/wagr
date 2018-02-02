class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :home_team
      t.string :away_team
      t.datetime :date
      t.string :favored_team
      t.decimal :spread

      t.timestamps
    end
  end
end
