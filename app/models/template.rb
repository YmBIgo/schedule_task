class Template < ApplicationRecord
    has_many :works
    has_many :knowhows

    def date_fixed
        date_flag = self.is_date_fixed
        # 0 => 固定 / 1 => start_date / 2 => end_date / else => today
        if [0,1,2].include?(date_flag) then
            return date_flag
        else
            return 3
        end
    end
end
