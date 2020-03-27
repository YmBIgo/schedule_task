class ChecklistsController < ApplicationController

    before_action :authenticate_role!
    before_action :authenticate_role_page!

    def create
        checklist = Checklist.new(create_params)
        if checklist.valid?
            checklist.save
            @checklist = checklist
        end
    end

    def update
        checklist = Checklist.find(params[:id])
        checklist_result = checklist.update(create_params)
        if checklist_result == true then
            @checklist = checklist
        end
    end

    private
    def create_params
        params.require(:checklist).permit(:c_name, :task_id, :checked)
    end

end
