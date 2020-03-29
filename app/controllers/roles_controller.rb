class RolesController < ApplicationController

    before_action :authenticate_role!, :only => [:show, :update]
    before_action :authenticate_role_page!, :only => [:show, :update]

    def show
        @role = Role.find(params[:id])
        @works = @role.works
        # work_id map
        work_ids = Work.where(:role_id => @role.id).map {|w| w.id}
        tasks = Task.where(:work_id => work_ids)
        @today_tasks = tasks.where(:end_date => Date.today).limit(5)
        @tomorrow_tasks = tasks.where(:end_date => Date.today + 1).limit(5)
        @this_week_tasks = tasks.where(:end_date => (Date.today + 2)..(Date.today + 6))
        @this_month_tasks = tasks.where(:end_date => (Date.today + 7)..(Date.today + 30))
    end
    def update
        @role = Role.find(params[:id])
        @role.update(update_params)
        if params["role"]["line_id"] != nil then
            @role.update(:is_line_friend => true)
        end
    end

    private
    def update_params
        params.require(:role).permit(:email, :line_id, :is_line_friend)
    end
end
