# define article model as class, inherits from ApplicationRecord
class Article < ApplicationRecord
    # ensures the title is present for any article to be saved
    # enforcing minimum data lengths for the title and the description
    validates :title, presence: true, length: {minimum: 6, maximum: 100}
    validates :description, presence: true, length: {minimum: 10, maximum: 300}
end