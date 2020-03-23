class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:work_id, :workurl, :password, :password_confirmation) }
        devise_parameter_sanitizer.permit(:login) { |u| u.permit(:work_id, :workurl, :password, :password_confirmation) }
    end
    
    def authenticate_role_page!
        if role_signed_in?
            current_work_url = current_role.workurl
            current_params = params[:id]
            if current_params != nil
                if controller_name == "tasks" then
                    t_task = Task.find_by(:id => current_params)
                    unless t_task.work.w_url == current_work_url then redirect_to work_path(current_role.workurl) end
                elsif controller_name == "works" then
                    w_work = Work.find_by(:w_url => current_params)
                    unless w_work.w_url == current_work_url then redirect_to work_path(current_role.workurl) end
                end
            end
        end
    end

end
