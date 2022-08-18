class BookmarksController < ApplicationController
  def new
    # on veut créer un nouveau bookmark mais il doit être relié à une liste avec un id spécifique
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      # indique à la vue ce qui s'est passé et lui permet d'afficher les messages d'erreur
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end


end
