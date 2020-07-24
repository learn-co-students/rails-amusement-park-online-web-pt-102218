class SessionsController < ApplicationController
    def new
        @user = User.new 
    end

    def create
        #binding.pry
        if params[:user] != nil
            @user = User.find_by(name: params[:user][:name])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else
                render 'new'
            end
        else 
            redirect_to 'new'
        end
    end

    def destroy
        #binding.pry
        session.clear
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end

end