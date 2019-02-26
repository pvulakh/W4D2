class CatsController < ApplicationController

    def index 
        @cats = Cat.all
        render :index 
    end 


    def show
        @cat = Cat.find_by(id: params[:id])
        @cat ? (render :show) : (redirect_to cats_url)
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create 
        @cat = Cat.create!(cat_params)
        redirect_to cat_url(@cat)
    end 

    def edit
        @cat = Cat.find_by(id: params[:id])
        if @cat
            render :edit
        else 
            redirect_to new_cat_url
        end
    end

    def update
        @cat = Cat.find_by(id: params[:id])
        if @cat.update(cat_params)
            render :show
        else  
            redirect_to cats_url
        end 
    end

    private
    def cat_params
        params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
    end

end 