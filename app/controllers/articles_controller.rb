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

    def edit
        # find the article based on the ID from the params hash
        @article = Article.find(params[:id])
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

    #Update definition
    def update
        # find the specific article to update by ID
        @article = Article.find(params[:id])
        # if the update was successful
        if @article.update(params.require(:article).permit(:title, :description))
            # display msg on screen
            flash[:notice] = "Article was updated successfully"
            redirect_to @article
        # if the update was not successful, show the edit screen again
        else
            render 'edit'
        end
    end
end 