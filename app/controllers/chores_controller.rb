class ChoresController < ApplicationController
  before_action :set_chore, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required

  # GET /chores
  # GET /chores.json
  def index
    #@chores = Chore.all
    @chores = current_user.chores.recent
    #binding.pry

  end

  # GET /chores/new
  def new
    #@chore = Chore.new
    @chore = current_user.chores.build

  end

  # POST /chores
  # POST /chores.json
  def create
    #@category_all = Category.find(name: category_params[:categories][])
    #updated_params = chore_params.merge({category_ids: @category_all.ids})
    #@chore = current_user.chores.build(updated_params)
    #binding.prys
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



  # GET /chores/1
  # GET /chores/1.json
  def show
   #binding.pry
    @task = @chore.tasks.build
    @task.lists.build

    @comment = @chore.comments.build

  end



  # GET /chores/1/edit
  def edit
  end



  # PATCH/PUT /chores/1
  # PATCH/PUT /chores/1.json
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

  # DELETE /chores/1
  # DELETE /chores/1.json
  def destroy
    @chore.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Chore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chore
      @chore = Chore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chore_params
      params.require(:chore).permit(:title, :description, :user_id, category_ids:[])
    end

    # def category_params
    #     params.require(:chore).permit(:name, category_ids:[])
    # end
end
