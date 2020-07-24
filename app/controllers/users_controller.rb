class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def show
        return redirect_to :root unless logged_in?
        @user = User.find(params[:id])
    end
    
    def create
        if params[:user][:password].nil? || params[:user][:password].empty?
            redirect_to :root
        else
            user = User.create(user_params)
            session[:user_id] = user.id
            redirect_to user_path(user) 
        end
    end

    def signin
        @user = User.new
    end

    def login
        user = User.find_by_name(user_params[:name])
        return redirect_to "/signin" unless user.authenticate(user_params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user)
    end

    def logout
        session.delete :user_id
        redirect_to :root
    end

    private

    def user_params(*args)
        params.require(:user).permit(:id, :name, :nausea, :happiness, :tickets, :height, :password, :admin)
    end
end
