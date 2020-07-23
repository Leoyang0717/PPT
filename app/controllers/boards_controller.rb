class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end
  def new
  end
  def create
    Board.create(title: params[:title],intro: params[:intro])
    redirect_to 'boards_path'
  end
end
