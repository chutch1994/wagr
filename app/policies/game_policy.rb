class GamePolicy < ApplicationPolicy
	attr_reader :user, :game

	def initialize(user, game)
		@user = user
		@game = game
	end

	def index?
		user.admin?
	end

	def new?
		user.admin?
	end

	def update?
		user.admin?
	end	
end
