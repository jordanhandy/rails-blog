module ApplicationHelper
    def gravatar_for(user, options = { size: 80 })
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
    end

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
