class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      puts @list.errors.messages
      # indique à la vue ce qui s'est passé et lui permet d'afficher les messages d'erreur
      render :new, status: :unprocessable_entity
    end


  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
