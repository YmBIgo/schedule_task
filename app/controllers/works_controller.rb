class WorksController < ApplicationController

    def new
        # binding.pry
        @today = Time.parse(params["start-date"])
        @tasks = Work.find(1).tasks
    end

    def show
        @work = Work.find_by(:w_url => params[:id])
        @tasks = @work.tasks
        @recent_tasks = @work.tasks.where.not(:parent_task_id => 0).order(start_date: "DESC").limit(3)
        @recent_task_top = Task.find_by(:parent_task_id => 0, :t_number => @recent_tasks.first.t_number)
        @persons = Person.all.order(:id)
    end
    def index
    end

    private
    def generate_gassyuku

    end

end