#ArticlesController inherits from ApplicationController
class ArticlesController < ApplicationController
  before_action :set_article, only:[:show, :edit, :update, :destroy]

    def show
        #Assign an item from the Article table to a variable
        #params are the parameters passed in, and can be accessed by
        #[:param_name]

        #accessing article id tp show on page

        #'@' converts a variable to an instance variable
        # @article = Article.find(params[:id])
    end
    def index
        # show all
        # @articles = Article.all

        # add pagination
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end
    def new
        # creat article instance variable for use with new submissions
        @article = Article.new
    end

    def edit
        # find the article based on the ID from the params hash
        # @article = Article.find(params[:id])
    end

    def create
        # create new article with instance variable
        # values need to be whitelisted to be allowed
        # to post
        # @article = Article.new(params.require(:article).permit(:title, :description))
        
        @article = Article.new(article_params_whitelist)
        # assign the user who created the article to the currently logged in user
        # see the application controller helper methods
        @article.user = current_user
        
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
        # @article = Article.find(params[:id])
        # if the update was successful
        # if @article.update(params.require(:article).permit(:title, :description))

        if @article.update(params.require(:article).permit(:title, :description))
            # display msg on screen
            flash[:notice] = "Article was updated successfully"
            redirect_to @article
        # if the update was not successful, show the edit screen again
        else
            render 'edit'
        end
    end
    # destroy route
    def destroy
      # @article = Article.find(params[:id])
      @article.destroy
      redirect_to articles_path
    end

    # This private is NOT a code block.  Anything following it is simply a private method
    # or function
    private 

    # for refactoring.  Run before any action to grab the article ID for specific actions
    def set_article
      @article = Article.find(params[:id])
    end
    # for refactoring
    # returns the whitelisted params for use in the create and update actions
    def article_params_whitelist
      params.require(:article).permit(:title, :description)
    end
end 