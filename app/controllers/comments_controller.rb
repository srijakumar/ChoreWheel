class CommentsController < ApplicationController

  before_action :set_chore
  before_action :set_comment, except: [:create, :show]


  def index
    @comments = Comment.all
  end

  def new
  @comment = Comment.new(comment_params)
  end

  def create
    @comment = @chore.comments.create(comment_params)
    redirect_to @comment

    # chore_comment = @chore.comments.new(user_id: current_user.id)
    # chore_comment.save
    # redirect_to chore_path(@chore)
  end

  def show

  end

  def destroy
    if @comment.destroy
      flash[:success] = "Comment was deleted"
    else
      flash[:error] = "Comment not deleted. Please try again"
    end
    redirect_to @chore
  end


private

  def set_chore
    binding.pry
      @chore = Chore.find(params[:chore_id])
  end

  def set_comment #refactored since both destroy and complete method use it

    @comment = @chore.comments.find(params[:id])
    #@comment = @chore.comments.find(user_id: current_user.id)

  end

  def comment_params #content is used pretty much in all create, edit, delete
    params[:comment].permit(:content)
  end

end
