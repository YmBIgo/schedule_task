class WorksController < ApplicationController

    def new
        # binding.pry
        @tasks = Work.find(1).tasks
    end

    def show
        @work = Work.find_by(:w_url => params[:id])
        @tasks = @work.tasks
        @recent_tasks = @work.tasks.where.not(:parent_task_id => 0).order(start_date: "ASC").limit(3)
    end
    def index
    end

    private
    def generate_gassyuku

    end

end
