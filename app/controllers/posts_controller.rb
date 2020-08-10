class PostsController < ApplicationController
  before_action :find_board,only: [:new,:create]
  before_action :find_post,only: [:show,:destroy]
  before_action :authenticate_user! ,except: [:show]

  def new
    @post = @board.posts.new
  end

  def create
    @post = @board.posts.new(post_params)
    if @post.save
      redirect_to @board ,notice: '文章新增成功'
    else
      render :new
    end
  end

  def show
    @comment = @post.comments.new
    @comments = @post.comments.order(id: :desc)
  end

  def edit
    find_current_user
  end

  def update
    find_current_user
    if @post.update(post_params)
      redirect_to @post ,notice: '文章編輯成功'
    else
      render :edit
    end
  end
  
  def destroy
    if @post.destroy
      redirect_to board_path(@post.board_id) ,notice: '文章刪除成功'
    end
  end


  private
  def post_params
    params.require(:post).permit(:title, :content).merge(user: current_user)
  end
  def find_board
    @board = Board.find(params[:board_id])
  end
  def find_post
    @post = Post.find(params[:id])
  end
  def find_current_user
    @post = current_user.posts.find(params[:id])
  end
end