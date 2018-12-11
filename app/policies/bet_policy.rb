class BetPolicy
  attr_reader :current_user, :bet

  def initialize(current_user, bet)
    @current_user = current_user
    @bet = bet
  end

  def new?
    @current_user
  end

  def show?
    @current_user
  end

  def edit?
    @current_user and (@current_user.admin? or @current_user.id == @bet.user_id)
  end

  def update?
    @current_user.admin? or @current_user.id == @bet.user_id
  end
end

