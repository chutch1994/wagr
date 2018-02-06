class AmountValidator < ActiveModel::Validator
  def validate(record)
    player = Player.find_by_id(record.player_id)
    if record.wager > player.bettable_money
      record.errors[:base] << "Can't wager more than what you have"
    end 
  end
end

class Bet < ApplicationRecord
  belongs_to :player
  belongs_to :game

  validates_with AmountValidator

  after_save :update_bettable_money

  private
    def update_bettable_money
      player = Player.find_by_id(self.player_id)
      player.bettable_money -= self.wager
      player.save!
    end
end

