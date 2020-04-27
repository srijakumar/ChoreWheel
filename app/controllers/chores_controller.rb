class ChoresController < ApplicationController
  before_action :set_chore, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required


  def index
    #binding.pry
    @chores = current_user.chores.recent
  end


  def new
    @chore = current_user.chores.build
  end

  def create
    @chore = current_user.chores.build(chore_params)

    respond_to do |format|
      if @chore.save
        format.html { redirect_to @chore, notice: 'Chore was successfully created.' }
        format.json { render :show, status: :created, location: @chore }
      else
        format.html { render :new }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @task = @chore.tasks.build
    @task.lists.build
    @comment = @chore.comments.build
  end


  def edit
  end

  def update
    respond_to do |format|
      if @chore.update(chore_params)
        format.html { redirect_to @chore, notice: 'Chore was successfully updated.' }
        format.json { render :show, status: :ok, location: @chore }
      else
        format.html { render :edit }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chore.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Chore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_chore
      @chore = Chore.find(params[:id])
    end

    def chore_params
      #params.require(:chore).permit(:title, :description, :user_id, category_ids:[])
      params.require(:chore).permit(:title, :description, :user_id, :category_id)
    end

end
