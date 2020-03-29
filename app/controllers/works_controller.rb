require "securerandom"

class WorksController < ApplicationController

    before_action :authenticate_role!, :only => [:show, :welcome]
    before_action :authenticate_role_page!, :only => [:show, :welcome]

    def new
        if params["start-date"] == nil then
            @today = Time.now.next_day(200)
        else
            @today = Time.parse(params["start-date"])
        end
        @templates = Template.all
        @tasks = Task.new.default_input(params["schedule-type"])
        @task = TaskCollection.new
        @work  = Work.new
    end

    def show
        @work = Work.find_by(:w_url => params[:id])
        @role = @work.role
        @tasks = @work.tasks.order(:id)
        # @recent_tasks = @work.tasks.where.not(:parent_task_id => 0).where('end_date <= ?', Date.today+7).limit(4)
        @recent_tasks = @work.tasks.where.not(:parent_task_id => 0).order(end_date: "ASC").limit(4)
        @recent_task_top = @work.tasks.find_by(:parent_task_id => 0, :t_number => @recent_tasks.first.t_number)
        @persons = @work.tasks.pluck(:role).uniq
        @late_tasks = @work.tasks.where('end_date <= ?', Date.today+1).limit(3)
    end

    def index
    end

    def create
        @work = Work.new(work_params)
        @tasks = TaskCollection.new(task_params)
        email = params[:email]
        template_name = params[:template]
        while (work_url = SecureRandom.hex(10))
            if Work.find_by(:w_url => work_url) == nil then
                template_id = @work.template_name_id(template_name)
                @work.update(:w_url => work_url, :w_percent => 0, :template_id => template_id)
                break
            end
        end
        
        if current_role == nil then
            g_password = generate_password()
            role = Role.new(:workurl => @work.w_url, :password => g_password, :email => params[:work][:email])
            if role.save then sign_in role else redirect_to "/works/new"; return end
        else
            role = current_role
        end
        @work.role_id = role.id
        if @work.save then
            if @tasks.save(@work.id) then
                works_url = request.url.gsub("/works", "/") + "login?guijhw=" + @work.w_url
                # NotificationMailer.send_confirm_to_user(role, g_password, email, works_url).deliver
                # NotificationMailer.send_confirm_to_admin(role, g_password, email, works_url).deliver
                # ユーザー名とパスワードのページに飛ばせたい
                if role.works.length == 1 then
                    redirect_to "/welcome?g_password=#{g_password}"
                    return
                else
                    redirect_to "/roles/#{role.id}"
                    return
                end
            end
        end
        redirect_to "/works/new"
    end

    def welcome
    end

    def confirm
        @templates = Template.all
        @template_name = params["schedule-type"]
    end

    private

    def generate_password()
        new_password = SecureRandom.hex(10)[0..8]
        return new_password
    end

    def work_params
        params.require(:work).permit(:w_name, :email)
    end
    def task_params
        params.require(:tasks)
    end

end