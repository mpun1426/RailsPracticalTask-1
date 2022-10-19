class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create         #下記params以降のストロングパラメーターはprivate配下にtask_paramsを定義して置いて、ココにはtask_paramsを代入するように！
    @task = Task.new(params.require(:task).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @task.save
      redirect_to :tasks
      flash[:notice] = "スケジュールを保存しました（新規作成）"
    else
      render "new"
    end
  end
  
  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :start_date, :end_date, :all_day, :memo))
      flash[:notice] = "スケジュールを保存しました（編集）"
      redirect_to :tasks
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "削除しました"
    redirect_to :tasks
  end
end
