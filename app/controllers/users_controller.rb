class UsersController < ApplicationController

  def welcome 
  end
  
  
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      render :new
    end
  end

  def show 
     return redirect_to root_path unless logged_in?
     @user = User.find_by(id: params[:id])
  end

  def edit 
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit 
    end
  end


  private 

  def user_params 
    params.require(:user).permit(:name, :password, :tickets, :nausea, :happiness, :height, :admin)
  end

  
end
