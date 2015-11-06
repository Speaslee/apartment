class Api::RepairsController < Api::BaseController
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
    name: params[:name],
    description: params[:description],
    user_id: current_user.id
    )
  end

  def update
    if current_user.id == Repair.find(params[:id]).user_id
      Repair.find(params[:id]).update(
      description: params[:description]
      )
    elsif current_user.admin == true && params[:completed] == true
      Repair.find(params[:id]).update(
      completed: params[:completed],
      date_completed: params[:updated_at]
      )
    elsif current_user.admin == true && params[:completed] == false
      Repair.find(params[:id]).update(
      completed: params[:completed],
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
