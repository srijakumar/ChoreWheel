class CommentsController < ApplicationController

  before_action :set_chore, except: [:show]
  before_action :set_comment, except: [:create]





  def new
  @comment = Comment.new(comment_params)
  end

  def create

    @comment = @chore.comments.create(comment_params)
    #binding.pry
    redirect_to @chore

    # @comment = @chore.comments.new(user_id: current_user.id)
    # @comment.save
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
    #binding.pry
      @chore = Chore.find_by(params[:chore_id])
  end

  def set_comment #refactored since both destroy and complete method use it

    @comment = Comment.find_by(params[:id])
    #@comment = @chore.comments.find(user_id: current_user.id)

  end

  def comment_params #content is used pretty much in all create, edit, delete
    params[:comment].permit(:content)
  end

end
