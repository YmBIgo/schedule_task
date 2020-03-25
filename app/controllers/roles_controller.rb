class RolesController < ApplicationController

    before_action :authenticate_role!, :only => [:show, :update]
    before_action :authenticate_role_page!, :only => [:show, :update]

    def show
        @role = Role.find(params[:id])
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
