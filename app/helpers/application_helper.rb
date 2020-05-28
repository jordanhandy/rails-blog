module ApplicationHelper
    def gravatar_for(user, options = { size: 80 })
        email_address = user.email.downcase
        hash = Digest::MD5.hexdigest(email_address)
        size = options[:size]
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
    end

    def flash_class(level)
        case level.to_sym
        when :notice then "alert alert-info alert-dismissable fade show"
        when :success then "alert alert-success alert-dismissable fade show"
        when :error then "alert alert-danger alert-dismissable fade show"
        when :alert then "alert alert-danger alert-dismissable fade show"
        end
      end
end
