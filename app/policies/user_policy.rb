class UserPolicy
	attr_reader :user, :users

	def initialize(user, users)
		@user = user
		@users = users
	end

	def index?
		user.admin?
	end

	def update?
		user.admin?
	end	
end
