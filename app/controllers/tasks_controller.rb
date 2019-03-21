class TasksController < ApplicationController
    def index
      @tasks = Task.all
    end

    def show
      @task = Task.find(params[:id])
    end

    def new
      @task = Task.new
    end

    def create
      task = Task.new(task_params)
      task.save
      redirect_to tasks_url, notice: "タスクの「#{task.name}」を登録しました。"
    end

    private
    def task_params
      params.require(:task).permit(:name, :context, :closed_on)
    end
end
