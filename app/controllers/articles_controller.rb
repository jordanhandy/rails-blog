#ArticlesController inherits from ApplicationController
class ArticlesController < ApplicationController

    def show
        #Assign an item from the Article table to a variable
        #params are the parameters passed in, and can be accessed by
        #[:param_name]

        #accessing article id tp show on page

        #'@' converts a variable to an instance variable
        @article = Article.find(params[:id])
    end
    def index
        # show all
        @articles = Article.all
    end
    def new
    end
    def create
    end
end 