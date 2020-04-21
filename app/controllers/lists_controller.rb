class ListsController < ApplicationController

  before_action :set_task
  before_action :set_list, except: [:new, :create]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = @task.lists.new(list_params)
    redirect_to @task

  end

  def show
  end

  def edit
  end

  def update
      if @list.update(list_params)
        redirect_to @list
        render :show
      else
        render :edit
      end
    end


  def destroy

    if @list.destroy
      flash[:success] = "List was deleted"
    else
      flash[:error] = "List not deleted. Please try again"
    end
    redirect_to @task
  end


  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_list
    @list = @task.lists.find(params[:id])
  end


  def list_params 
    params.require(:list).permit(:content)
  end

end
