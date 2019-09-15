class ErrorsController < ActionController::Base
  def show
    ex = request.env["action_dispatch.exception"]
    if ex.kind_of?(ActionController::RoutingError)
      render "not_found", status: 404, formats: [:html]
    else
      render "internal_server_error", status: 500, formats: [:html]
    end
  end
end