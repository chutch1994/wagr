class Game < ApplicationRecord
  has_many :bets

  after_update :update_results

  private
    def update_results
      if self.away_team_score and self.home_team_score
       cover_team = nil
       differential = self.away_team_score - self.home_team_score

	if differential > 0
	  # If the home team was favored, but the away team won, then the away team covered.
	  if self.favored_team == self.home_team
	    cover_team = self.away_team
	  else
	    if differential.abs > self.spread.abs
	      cover_team = self.away_team
	    else
	      cover_team = self.home_team
	    end
	  end
	else
	  # If the away team was favored, but the home team won, then the home team covered.	
	  if self.favored_team == self.away_team
	    cover_team = self.home_team
	  else
	    if differential.abs > self.spread.abs
	      cover_team = self.home_team
	    else
	      cover_team = self.away_team
	    end
	  end
	end

	puts "#{cover_team}"
	self.bets.each do |bet|
	  player = Player.find_by_id bet.player_id
	  if bet.team == cover_team
	    # Player wins money
	    player.money += bet.wager
	    player.bettable_money += 2 * bet.wager
	  else
	    # Player loses money
	    player.money -= bet.wager
	  end
	  player.save!
	end 
      end
    end

end
