module Api
  class BaseController<ApplicationController
    class UserRequired< StandardError
    end

    before_action do
      request.format = :json
    end

  rescue_from StandardError do |e|
    render json: { error: e.message, trace: e.backtrace.first}, status: 500
  end


  end
end
