require "securerandom"

class WorksController < ApplicationController

    def new
        # binding.pry
        @today = Time.parse(params["start-date"])
        @tasks = Work.find(1).tasks
        @work  = Work.new
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

    def create
        @work = Work.create(work_params)
        while (work_url = SecureRandom.hex(10))
            if Work.find_by(:w_url => work_url) == nil then
                @work.update(:w_url => work_url)
                break
            end
        end
        redirect_to work_path(@work.w_url)
    end

    private
    def generate_gassyuku
    end
    def work_params
        params.require(:work).require(:w_name, :email)
    end

end