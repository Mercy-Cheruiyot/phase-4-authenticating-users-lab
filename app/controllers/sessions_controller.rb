class SessionsController < ApplicationController
    def create
        user = User.find_by(username: params[:username])

        if(user.nil?)
            render json: {error: "Unauthorized"}, status: 401
        else
            session[:user_id] = user.id 
            render json: user, status: :ok
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end

 
end