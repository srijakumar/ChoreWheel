class CommentsController < ApplicationController

  before_action :set_chore, except: [:edit, :show, :update]
  before_action :set_comment, except: [:create]

  def index

    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    #binding.pry
    @comment = @chore.comments.new(comment_params)

    redirect_to @chore



    # @comment = @chore.comments.new(user_id: current_user.id)
    # @comment.save
    # redirect_to chore_path(@chore)
  end

  def show
    binding.pry
  end

  def edit
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
      @chore = Chore.find(params[:chore_id])
  end

  def set_comment #refactored since both destroy and complete method use it

    @comment = Comment.find_by(params[:id])
    #@comment = @chore.comments.find(user_id: current_user.id)

  end

  def comment_params #content is used pretty much in all create, edit, delete
    params[:comment].permit(:content, :chore_id)
  end



end
