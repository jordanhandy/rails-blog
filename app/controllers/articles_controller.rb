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
        # creat article instance variable for use with new submissions
        @article = Article.new
    end
    def create
        # create new article with instance variable
        # values need to be whitelisted to be allowed
        # to post
        @article = Article.new(params.require(:article).permit(:title, :description))
        # save the article
        if @article.save
          flash[:notice] = "Article was created successfully"
        
        # flash[:alert] = "Something went wrong"
        # redirect to the page of the article
        #redirect_to article_path(@article)
          redirect_to @article
        else
          render 'new'
        end
    end
end 