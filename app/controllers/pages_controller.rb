class PagesController < ApplicationController
#class PagesController < ActionController::Base
    def home
        redirect_to articles_path if logged_in?
    end
    def about
    end
end