class Task < ApplicationRecord
    belongs_to :work
    belongs_to :person

    def task_status
        if self.done == true then
            return ["完了", "success"]
        else
            return ["未完了", "danger"]
        end
    end
end
