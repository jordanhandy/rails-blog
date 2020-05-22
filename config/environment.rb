# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Get rid of "field-with-errors" div class for formatting CSS
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    html_tag.html_safe
end
