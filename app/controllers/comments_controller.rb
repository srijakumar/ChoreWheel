class CommentsController < ApplicationController

  before_action :set_chore, except: [:edit, :show, :update]
  before_action :set_comment, except: [:create]

  def index
    @comments = current_user.comments

  end

  def new
    @comment = Comment.new(comment_params)
  end

  def create
    @comment = @chore.comments.create(comment_params)
    render '/comments/show'
  end

  def show
  end

  def edit
  end

  def update
      if @comment.update(comment_params)
        redirect_to @comment
      else
        render :edit
      end
    end

  def destroy
    if @comment.destroy
      flash[:success] = "Comment was deleted"
    else
      flash[:error] = "Comment not deleted. Please try again"
    end
    redirect_to @comment
  end


private

  def set_chore
    @chore = Chore.find_by(params[:chore_id])
  end

  def set_comment
    @comment = Comment.find_by(id: params[:id])
  end

  def comment_params
    params[:comment].permit(:content, :chore_id)
  end

end
