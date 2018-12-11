class WelcomeController < ApplicationController
  def league_info
    if not user_signed_in?
      render 'welcome/index'
    end
    @games = Game.all
    @players = Player.all
  end
end
