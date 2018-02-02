class UserPolicy
	attr_reader :user, :users

	def initialize(user, users)
		@user = user
		@users = users
	end

	def index?
		puts "is admin: #{ user.admin? }"
		user.admin?
	end

	def update?
		user.admin?
	end	
end
