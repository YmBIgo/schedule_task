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
    def update
        @task = Task.find(params[:id])
        task_column_keys = params[params.keys[0]].keys
        task_content_array = []; @task_text = "";
        if task_column_keys.length == 1 then
            @task_column = task_column_keys[0];
        else 
            @task_column = "time"
        end
        task_column_keys.each do |k|
            task_content_array.push(params["task"][k]);
            @task_text = task_content_array.join("〜")
        end
        @task.update(update_params)
    end
    def done
        @task = Task.find(params[:id])
        @task.update(:done => true)
        task_length = @task.work.tasks.length
        finished_tasks_length = @task.work.tasks.where(:done => true).length
        task_percent = (finished_tasks_length.to_f / task_length.to_f)*100
        @task.work.update(:w_percent => task_percent)
    end
    def undone
        @task = Task.find(params[:id])
        @task.update(:done => false)
        task_length = @task.work.tasks.length
        finished_tasks_length = @task.work.tasks.where(:done => true).length
        task_percent = (finished_tasks_length.to_f / task_length.to_f)*100
        @task.work.update(:w_percent => task_percent)
    end

    private
    def update_params
        params.require(:task).permit(:t_name, :start_date, :end_date, :role, :reference_url, :reference_image, :reference_text, :details)
    end
end
