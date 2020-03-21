class TasksController < ApplicationController
    def show
        @task = Task.find(params[:id])
        @work = @task.work
        if @task.parent_task_id != 0 then
            @parent_task = Task.find_by(:parent_task_id => @task.parent_task_id)
        end
        @relate_tasks = Task.where(:t_number => @task.t_number, :work_id => @task.work_id).where.not(:id => @task.id)
    end
    def index
    end
end
