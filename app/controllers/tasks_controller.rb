class TasksController < ApplicationController

before_action :set_chore, except: [:edit, :show, :update]
before_action :set_task, except: [:create]#dont want to apply to create

def index
  @tasks = Task.all
end

  def new
    @task = Task.new(task_params)
  end

  def create
    @task = @chore.tasks.create(task_params)
    redirect_to @task
  end

  def show

  end

  def edit
    @task.lists.build unless @task.lists.any?
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
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
    @task.update(completed_at: Time.now)
    redirect_to @chore, notice: "Task Completed"
  end




  private

  def set_chore
    @chore = Chore.find(params[:chore_id])
  end

  def set_task
    @task = Task.find_by(id: params[:id])
  end

  def task_params
    params[:task].permit(:content, lists_attributes: [ :id, :title, :content])
  end

end
