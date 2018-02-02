json.extract! game, :id, :home_team, :away_team, :date, :favored_team, :spread, :created_at, :updated_at
json.url game_url(game, format: :json)
