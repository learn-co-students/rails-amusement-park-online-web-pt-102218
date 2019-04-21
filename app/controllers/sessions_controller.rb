class SessionsController < ApplicationController

    def new
       @users = User.all
    end

    def create
        if(@user = User.find_by(user_params(:id)))
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id

                redirect_to user_path(@user)
            else
                @users = User.all
                render :new
            end
        end
    end

    def logout
        session.delete(:user_id)
        redirect_to root_path
    end

    private

    def user_params(*args)
        params.require(:user).permit(*args)
    end
end
