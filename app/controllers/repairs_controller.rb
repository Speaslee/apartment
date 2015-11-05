class RepairsController < ActionController::Base
  def create
    Repair.create(
    name: params[:name],
    description: params[:description],
    user_id: current_user.id,
    )
  end

def new
end




end
