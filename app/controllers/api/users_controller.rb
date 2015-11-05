module Api
  class UsersController < BaseController
    def index
      @users = User.all
    end

    def show
      @user = User.find params[:id]
    end

    def send_alert
      #send general alerts to tenants(admin false users)
  end

  def send_repair_request
    p = current_user.repairs.find params[:id]
    UserMailer.repair_request(p)
  end

  def send_complete_alert
    p = @user.repairs.find params [:id]
    UserMailer.complete_repair(p)
  end
  end
end
