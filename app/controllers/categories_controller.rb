class CategoriesController < ApplicationController
    before_action :require_admin, except: [:index, :show]
    def new
        @category = Category.new
    end
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:notice] = "Category was successfully created"
            redirect_to @category
        else
            render 'new'
        end
    end

    def edit
        @category = Category.find(params[:id])
    end
    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            flash[:success] = "Category name was updated successfully"
            redirect_to category_path(@category)
        else
            render 'edit'
        end
    end

    def index
        @categories = Category.paginate(page: params[:page], per_page: 3)
        # @categories = Category.all
    end
    def show
        @category = Category.find(params[:id])
        @category_articles = @category.articles.paginate(page: params[:page], per_page: 3)
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end
    def require_admin
        if !(logged_in? && current_user.admin?)
            flash[:alert] = "Only admins can perform that action"
            redirect_to categories_path
        end
    end

end