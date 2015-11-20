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
    r= Repair.create(
    name: params[:name],
    repair_description: params[:repair_description],
    user_id: current_user.id
    )
    send_repair_request r
  end

  def update
    if current_user.id == Repair.find(params[:id]).user_id
       Repair.find(params[:id]).update(
      repair_description: params[:repair_description]
      )

    elsif current_user.admin == true
      r = Repair.find(params[:id]).update(
      completed: params[:completed],
      date_completed: Time.now
      )
      send_complete_alert r
    else
      render json: {error: "Cannot edit this repair request"}
    end
  end

  def show
    @repair = Repair.find params[:id]
  end

  def send_repair_request repair
    @repair = repair
      if @repair.save
      UserMailer.repair_request(@repair).deliver
    end
  end

  def send_complete_alert r
    @repair = r
      if @repair.update
      UserMailer.complete_repair(@repair).deliver
    end
  end

def delete
  r= Repair.find(params:id)
  r.destroy
end
end
