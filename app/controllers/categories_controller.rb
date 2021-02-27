class CategoriesController < ApplicationController
    before_action :authenticate_user!
    def index
        @categories = Category.where(user_id: current_user.id)
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            redirect_to categories_path
            flash[:notice] = "Category has been updated."
        else
            flash[:alert] = @category.errors.full_messages
            render :new
        end
    end

    def new
        
    end

    def create
        @category = Category.create(category_params)
        @category.user_id = current_user.id
        if @category.save
            redirect_to categories_path
            flash[:notice] = "Category has been created."
        else
            flash[:alert] = @category.errors.full_messages
            render :new
        end
    end

    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to categories_path
        flash[:alert] = "Category has been deleted!"
    end

    def filter
        @category = Category.find_by(id: params[:category_id],user_id: current_user.id)
        @tasks = Task.where(category_id: params[:category_id])
    end

    private
    def category_params
        params.require(:category).permit(:title, :description, :rating)
    end
end
