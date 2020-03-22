class TasksController < ApplicationController
    def show
        @task = Task.find(params[:id])
        @work = @task.work
        if @task.parent_task_id != 0 then
            @parent_task = Task.find_by(:parent_task_id => 0, :work_id => @work.id, :t_number => @task.t_number)
        end
        @relate_tasks = Task.where(:t_number => @task.t_number, :work_id => @task.work_id).where.not(:id => @task.id)
    end
    def index
    end
    def done
        @task = Task.find(params[:id])
        @task.update(:done => true)
    end
    def undone
        @task = Task.find(params[:id])
        @task.update(:done => false)
        logger.debug("\n#{@task.t_name} undone\n")
    end
end
