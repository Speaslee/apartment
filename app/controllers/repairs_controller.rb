class RepairsController < ActionController::Base
  def create
    Repair.create(
    name: params[:name],
    repair_description: params[:repair_description],
    user_id: current_user.id,
    )
  end

def new
end




end
