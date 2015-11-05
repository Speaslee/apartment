module Api
  class UsersController < BaseController
    def index
      if current_user == nil
        render json: {error: "Please log in"}
      else
      @users = User.all
    end
    end

    def show
      if current_user == nil
        render json: {error: "Please log in"}
      else
      @user = User.find params[:id]
    end
    end

    def send_alert
      #send general alerts to tenants(admin false users)

  end



  def
  end
end
