class CommentsController < ApplicationController

  before_action :set_chore, except: [:edit, :show, :update]
  before_action :set_comment, except: [:create]

  def index
    #binding.pry
    @comments = current_user.comments

  end

  def new
    @comment = Comment.new(comment_params)
  end

  def create
    @comment = @chore.comments.create(comment_params)
    #binding.pry
    #redirect_to @comment
    render '/comments/show'

    #redirect_to controller: :Chores, action: :show




    # @comment = @chore.comments.new(user_id: current_user.id)
    # @comment.save
    # redirect_to chore_path(@chore)
  end

  def show
    #binding.pry
  end

  def edit
  end

  def update
      if @comment.update(comment_params)
        redirect_to @comment
        #render :show
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
    #binding.pry
      @chore = Chore.find_by(params[:chore_id])
  end

  def set_comment #refactored since both destroy and complete method use it

    @comment = Comment.find_by(params[:id])
    #@comment = @chore.comments.find(user_id: current_user.id)

  end

  def comment_params #content is used pretty much in all create, edit, delete
    #binding.pry
    params[:comment].permit(:content, :chore_id)
  end



end
