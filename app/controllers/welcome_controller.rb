class WelcomeController < ApplicationController
  def index
		@games = Game.all
		@players = Player.all
  end
end
