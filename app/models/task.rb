class Task < ApplicationRecord
    belongs_to :work
    belongs_to :person
end
