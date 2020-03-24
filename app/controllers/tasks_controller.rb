class TasksController < ApplicationController

#set methods need to run before anything else happens
before_action :set_chore, except: [:show]
before_action :set_task, except: [:create]#dont want to apply to create

  def index
    @tasks = Task.all
  end


  def new
    @task = Task.new(task_params)

  end

  def create
    #which chore is the task being created for
    @task = @chore.tasks.create(task_params) #since task is a subroot of the chore
    #binding.pry
    #redirect_to @chore
    redirect_to @task
  end

  def show

  end

  def destroy
    if @task.destroy
      flash[:success] = "Task was deleted"
    else
      flash[:error] = "Task not deleted. Please try again"
    end
    redirect_to @chore
  end

  def complete
    @task.update_attribute(:completed_at, Time.now)
    redirect_to @chore, notice: "Task Completed"
  end




  private #applicable to only this controller

  def set_chore
    #binding.pry
    @chore = Chore.find(params[:chore_id])
  end

  def set_task #refactored since both destroy and complete method use it
    @task = Task.find_by(id: params[:id])
  end

  def task_params #content is used pretty much in all create, edit, delete
    params[:task].permit(:content, lists_attributes: [ :title, :content])
  end

end
