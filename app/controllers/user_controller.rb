class UserController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
		@users = User.all
		begin
			authorize @users
			render :index
		rescue
			redirect_to '/', notice: 'Not Authorized!'
		end
  end

  # GET /user/1/edit
  def edit
  end

  # PATCH/PUT /user/1
  # PATCH/PUT /user/1.json
  def update
		@user = User.find(params[:id])
		authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :admin, :email)
    end
end
