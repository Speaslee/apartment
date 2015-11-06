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

    def send_alert_mail
      #send general alerts to tenant
      if current_user.admin
        User.all.each do |p|
        UserMailer.send_alert(p).deliver
      end
    end
  end
  end
end
