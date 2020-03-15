class ListsController < ApplicationController

  #before_action :set_task
#  before_action :set_list, except: [:create]
def index
  
  @lists = List.all

end

  def create
    @list = @task.lists.create(list_params)
    redirect_to @task
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
    @task = Task.find(params[:task_id])
  end

  def set_list #refactored since both destroy and complete method use it
    @list = @task.lists.find(params[:id])
  end

  def list_params #content is used pretty much in all create, edit, delete
    params[:list].permit(:content)
  end

end
