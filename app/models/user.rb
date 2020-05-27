class User < ApplicationRecord
    # define User model
    # - Lowercase email address before before save
    # - Make association between users and many articles 
    # - ensure data validation for the presence of a username, and character limits
    # - ensure email is in the correct format
    # - ensure the users each have a secure password
    
    before_save {self.email = email.downcase}
    has_many :articles, dependent :destroy
    validates :username, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: { case_sensitive: false }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
    has_secure_password
end