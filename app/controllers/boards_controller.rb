class BoardsController < ApplicationController
  

  before_action :board_id,only: [:show,:edit,:update,:destroy,:favorite,:hide]
  before_action :authenticate_user! ,except: [:index,:show]

  def index
    @boards = Board.normal.page(params[:page])
  end

  def new
    @board = Board.new
    authorize @board, :new?
  end

  def hide
    @board.hide! if @board.may_hide?
    redirect_to boards_path,notice: '看板已隱藏'
  end
  def create
    @board = Board.new(board_params)
    @board.users << current_user
    authorize @board, :create?
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

    respond_to do |format|
      format.html { redirect_to favorites_path, notice: 'OK!' }
      format.json { render json: {status: @board.favorited_by?(current_user) } }
    end
  end
  private
  def board_params
    params.require(:board).permit(:title, :intro)
  end
  def board_id
    @board = Board.normal.find(params[:id])
  end

end
