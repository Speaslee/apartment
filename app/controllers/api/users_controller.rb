module Api
  class UsersController < BaseController
    skip_before_action :verify_authenticity_token
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

    def delete
      r= user.find(params:id)
      r.destroy
    end

    def send_alert_mail
      #send general alerts to tenant
      if current_user.admin
        User.all.each do |p|
        UserMailer.send_alert(p).deliver_now
      end
    end
  end
  end
end
