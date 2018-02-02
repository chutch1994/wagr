class PlayerPolicy
	attr_reader :current_user, :player

	def initialize(current_user, player)
		@current_user = current_user
		@player = player
	end

	def index?
		@current_user.admin?
	end

	def new?
		@current_user
	end

	def show?
		@current_user
	end

	def edit?	
		@current_user and (@current_user.admin? or @current_user == @user)
	end	
	
	def update?	
		@current_user.admin? or @current_user == @user
	end	
end
