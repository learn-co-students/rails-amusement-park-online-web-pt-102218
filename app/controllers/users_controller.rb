class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      # byebug
      return redirect_to user_path(@user)
    else
      flash[:warning] ||= ""
      @user.errors.full_messages.each do |m|
        flash[:warning] += "#{m}\n"
      end
      render 'new'
    end
  end

  def index

  end

  def show
    # byebug
    return redirect_to root_path unless session[:user_id] == params[:id].to_i
    @user = User.find_by_id(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :nausea, :happiness, :tickets, :height, :admin, :password, :password_confirmation)
  end
end
