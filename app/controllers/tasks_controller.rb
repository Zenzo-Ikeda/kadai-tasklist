class TasksController < ApplicationController
  before_action :set_task , only:[:show,:edit,:update,:destroy]
  before_action :check_user, only: [:show,:edit,:update,:destroy]
  before_action :require_user_logged_in,
  
  def index
    if logged_in?
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
    end
  end
  
  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'タスクが登録されました'
      redirect_to @task
    else 
      flash.now[:denger] = 'タスクが登録されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:success] = 'taskは正常に更新されました'
      redirect_to @task
    else
      flash.now[:denger] = 'taskは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    flash[:success] = 'taskは正常に削除されました'
    redirect_to tasks_url
  end
 
 private
  def set_task
    @task = Task.find_by(id: params[:id])
  end
  
  #Storong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def check_user
    #redirect_to signup_url if @task.nil? || current_user != @task.user
    redirect_to root_url if current_user != @task&.user
    return
  end

end
