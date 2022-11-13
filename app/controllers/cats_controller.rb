class CatsController < ApplicationController

    def index
        @cats = Cat.all
        render :index
    end

    def create
        @cat = Cat.new #(cat_params)
        render :new
        # if cat.save
        #     render :new         
        # else
        #     render json: @cat.errors.full_messages, status: 422
        # end
    end

    def new
        @cat = Cat.new
        render :new
    end

    def edit
        @cat = Cat.find(params[:id])
        render :edit
        # render json: @cat
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        render :show
    end

    def update
        @cat = Cat.find_by(id: params[:id])
        if cat.update(cat_params)
            render json: @cat
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end


    private
    def cat_params
        params.require(:cat).permit(:name, :birth_date, :color, :sex)
    end

end