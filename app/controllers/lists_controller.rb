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
  end

  def destroy
    if @list.destroy
      flash[:success] = "List was deleted"
    else
      flash[:error] = "List not deleted. Please try again"
    end
    redirect_to @task
  end


  private #applicable to only this controller

  def set_task
    #byebug
    @task = Task.find(params[:task_id])
  end

  def set_list #refactored since both destroy and complete method use it
    @list = @task.lists.find(params[:id])
  end


  def list_params #content is used pretty much in all create, edit, delete
    params.require(:list).permit(:content)
  end
