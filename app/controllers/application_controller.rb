class ApplicationController < ActionController::Base

    # helper_method makes it usable to views as a helper method as well.
    helper_method :current_user, :logged_in?
    def current_user
        # memoization.  If current_user exists, use this
        # if not, query to find current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        # !! converts the variable to a boolean
        # this method returns a bool based on if current_user exists
        !!current_user
    end

end
