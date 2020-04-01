class Work < ApplicationRecord
    has_many :tasks
    belongs_to :template
    belongs_to :role
    has_many :knowhows

    def template_name_id(work_name)
        knowhow_id = Knowhow.find_by(:k_name => work_name)
        if knowhow_id == nil then
            return 100
        else
            template_id = knowhow_id.template.id
            return template_id
        end
    end
end
