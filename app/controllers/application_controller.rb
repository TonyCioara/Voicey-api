class ApplicationController < ActionController::API

    # Import HttpAuthentication library from action controller
    include ActionController::HttpAuthentication::Token:ControllerMethods
    # Require authentication for all controllers in our app
    before_action :require_login

    def require_login
        authorize_request || render_unauthorized("Access denied")
    end

    # Helper method to find current user
    def current_user
        @current_user ||= authorize_request
    end

    # Renders a message when a user is unauthorized
    def render_unauthorized(message)
        errors = { errors: [ { detail: message } ] }
        render json: errors, status: :unauthorized
    end

    private
    # Authenticate a user with a token
    def authorize_request
        authenticate_with_http_token do |token, option|
            User.find_by(token: token)
        end
    end
end
