class BoardsController < ApplicationController
  

  before_action :board_id,only: [:show,:edit,:update,:destroy,:favorite]
  before_action :authenticate_user! ,except: [:index,:show]
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path,notice: "新增成功"
    else
      render :new
    end
  end

  def show
    @post = @board.posts
  end
  def edit
  end
  def update
    if @board.update(board_params)
      redirect_to boards_path,notice: "修改成功"
    else
      render :edit
    end
  end

  def destroy
    if @board.destroy
      redirect_to boards_path,notice: "刪除成功"
    end
  end
  def favorite
    current_user.toggle_favorite(@board)
    redirect_to favorites_path, notice: 'OK!'
  end
  private
  def board_params
    params.require(:board).permit(:title, :intro)
  end
  def board_id
    @board = Board.find(params[:id])
  end

end
