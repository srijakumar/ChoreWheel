class TasksController < ApplicationController

#set methods need to run before anything else happens
before_action :set_chore

  def create
    #which chore is the task being created for
    @task = @chore.tasks.create(task_params) #since task is a subroot of the chore
    redirect_to @chore
  end

  def destroy
    @task = @chore.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Task was deleted"
    else
      flash[:error] = "Task not deleted. Please try again"
    end
    redirect_to @chore
  end


  private #applicable to only this controller

  def set_chore
    @chore = Chore.find(params[:chore_id])
  end

  def task_params #content is used pretty much in all create, edit, delete
    params[:task].permit(:content)
  end

end
