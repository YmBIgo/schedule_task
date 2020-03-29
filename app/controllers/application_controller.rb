class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:workurl, :email, :password, :password_confirmation) }
        devise_parameter_sanitizer.permit(:login) { |u| u.permit(:workurl, :email, :password, :password_confirmation) }
    end
    
    def authenticate_role_page!
        # binding.pry
        if role_signed_in?
            # 
            # [redirect 先 を変更する]
            # 
            # 原始的だが、action / controller で分ける？
            # 
            # tasks     id付き  -> done / undone / pushdate / update
            #           idなし  ->
            # checklist id付き  -> update
            #           idなし  -> create 必要なし？
            # role      id付き  -> r_update / show
            # works     idなし  -> 
            #           id付き  -> show
            # 
            # controller_name / action_name で分岐
            # 
            if controller_name == "tasks" then
                if ["done", "undone", "pushdate", "update", "show"].include?(action_name) then
                    current_task = Task.find(params[:id])
                    if current_task == nil then
                        redirect_to "/roles/#{current_role.id}"
                    else
                        task_parent = current_task.work.role
                        unless task_parent == current_role then redirect_to "/roles/#{current_role.id}" end
                    end
                end
            elsif controller_name == "works" then
                if action_name == "show" then
                    current_work = Work.find_by(:w_url => params[:id])
                    if current_work == nil then
                        redirect_to "/roles/#{current_role.id}"
                    else
                        work_parent  = current_work.role
                        unless work_parent == current_role then redirect_to "/roles/#{current_role.id}" end
                    end
                elsif action_name == "welcome" then
                end
            elsif controller_name == "checklists" then
                if action_name == "update" then
                    current_checklist = Checklist.find(params[:id])
                    if current_checklist == nil then 
                        redirect_to "/roles/#{current_role.id}"
                    else
                        checklist_parent = current_checklist.task.work.role
                        unless checklist_parent == current_role then redirect_to "/roles/#{current_role.id}" end
                    end
                end
            elsif controller_name == "roles" then
                if action_name == "show" then
                    current_id_role = Role.find(params[:id])
                    unless current_id_role == current_role then redirect_to "/roles/#{current_role.id}" end
                end
            else
                redirect_to "/roles/#{current_role.id}"
            end
        end
    end

    def redirect_to_role!
        if role_signed_in?
            redirect_to work_path(current_role.workurl)
        end
    end

end
