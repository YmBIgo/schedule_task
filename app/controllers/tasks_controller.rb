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
        task_length = @task.work.tasks.length
        finished_tasks_length = Task.where(:done => true).length
        task_percent = (finished_tasks_length.to_f / task_length.to_f)*100
        @task.work.update(:w_percent => task_percent)
    end
    def undone
        @task = Task.find(params[:id])
        @task.update(:done => false)
        task_length = @task.work.tasks.length
        finished_tasks_length = Task.where(:done => true).length
        task_percent = (finished_tasks_length.to_f / task_length.to_f)*100
        @task.work.update(:w_percent => task_percent)
    end
end
