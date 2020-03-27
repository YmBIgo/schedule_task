class Checklist < ApplicationRecord
    validates :c_name, presence: true
    belongs_to :task
end
