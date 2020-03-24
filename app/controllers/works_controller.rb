require "securerandom"

class WorksController < ApplicationController

    before_action :authenticate_role!, :only => [:show, :welcome]
    before_action :authenticate_role_page!, :only => [:show, :welcome]

    def new
        # binding.pry
        @today = Time.parse(params["start-date"])
        @tasks = Task.new.default_input(params["schedule-type"])
        @task = TaskCollection.new
        @work  = Work.new
    end

    def show
        @work = Work.find_by(:w_url => params[:id])
        @tasks = @work.tasks.order(:id)
        # @recent_tasks = @work.tasks.where.not(:parent_task_id => 0).where('end_date <= ?', Date.today+7).limit(4)
        @recent_tasks = @work.tasks.where.not(:parent_task_id => 0).order(end_date: "ASC").limit(4)
        @recent_task_top = @work.tasks.find_by(:parent_task_id => 0, :t_number => @recent_tasks.first.t_number)
        @persons = @work.tasks.pluck(:role).uniq
        @late_tasks = Task.where('end_date <= ?', Date.today+1).limit(3)
    end

    def index
    end

    def create
        @work = Work.new(work_params)
        @tasks = TaskCollection.new(task_params)
        email = params[:email]
        while (work_url = SecureRandom.hex(10))
            if Work.find_by(:w_url => work_url) == nil then
                @work.update(:w_url => work_url, :w_percent => 0)
                break
            end
        end
        if @work.save then
            if @tasks.save(@work.id) then
                g_password = generate_password()
                role = Role.create(:workurl => @work.w_url, :work_id => @work.id, :password => g_password)
                if role.save then
                    works_url = request.url.gsub("/works", "/") + "login?guijhw=" + @work.w_url
                    NotificationMailer.send_confirm_to_user(role, g_password, email, works_url).deliver
                    NotificationMailer.send_confirm_to_admin(role, g_password, email, works_url).deliver
                    sign_in role
                    # ユーザー名とパスワードのページに飛ばせたい
                    redirect_to "/welcome?g_password=#{g_password}"
                    return
                end
            end
        end
        redirect_to "/works/new"
    end

    def welcome
    end

    private

    def generate_password()
        new_password = SecureRandom.hex(10)[0..3]
        return new_password
    end

    def work_params
        params.require(:work).permit(:w_name)
    end
    def task_params
        params.require(:tasks)
    end

end