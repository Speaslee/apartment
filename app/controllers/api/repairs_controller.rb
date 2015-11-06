class Api::RepairsController < Api::BaseController
  skip_before_action :verify_authenticity_token
  def search
    @repairs = Repair.search params[:q]
  end

  def index
  if current_user == nil
    render json: {error: "Please log in"}
    elsif current_user.admin == false
      @repairs = current_user.repairs
    else
      @repairs = Repair.all
    end
  end

  def create
    Repair.create(
    name: body_params[:name],
    description: body_params[:description],
    user_id: current_user.id
    )
  end

  def update
    if current_user.id == Repair.find(params[:id]).user_id
      Repair.find(params[:id]).update(
      description: body_params[:description]
      )
    elsif current_user.admin == true && body_params[:completed] == true
      Repair.find(params[:id]).update(
      completed: body_params[:completed],
      date_completed: body_params[:updated_at]
      )
    elsif current_user.admin == true
      Repair.find(params[:id]).update(
      completed: body_params[:completed],
      date_completed: nil
      )
    else
      render json: {error: "Cannot edit this repair request"}
    end
  end

  def show
    @repair = Repair.find params[:id]
  end

  def send_repair_request
      if @repair.save
      p = current_user.repairs.find params[:id]
      UserMailer.repair_request(p).deliver
    end
  end

  def send_complete_alert
      if @repair.update
      p = @user.repairs.find params [:id]
      UserMailer.complete_repair(p).deliver
    end
  end

end
