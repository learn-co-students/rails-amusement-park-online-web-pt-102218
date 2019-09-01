class SessionsController < ApplicationController
    def new
        @user = User.name 
    end

    def create
        @user = User.find_by(name: params[:user_name])
        if @user && user.authenticate(params[:user_password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end

end