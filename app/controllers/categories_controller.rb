class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def show 
        @category = Category.find_by(title: params[:title])
    end

    def edit
        @category = Category.find_by(title: params[:title])
    end

    def update
        category = Category.find_by(title: params[:title])
        if category.update(category_params)
            redirect_to categories_path
        else
            render :new
        end
    end

    def new
    end

    def create
        @category = Category.create(category_params)
        if @category.save
            redirect_to categories_path
        else
            render :new
        end
    end

    def delete
        category = Category.find_by(title: params[:title])
        category.destroy
        redirect_to categories_path
    end

    private
    def category_params
        params.require(:category).permit(:title, :description, :rating)
    end
end
