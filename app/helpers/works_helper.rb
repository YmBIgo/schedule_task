module WorksHelper
    def year_month_date(d_date)
        r_date = d_date.strftime("%Y-%m-%d")
        return r_date
    end
    def task_schedule_to_task_calendar(task, start_date, end_date, diff_date, href_flag)
        t_start_date = task.start_date
        t_end_date   = task.end_date
        w_date_array = [[start_date,start_date+diff_date], [start_date+diff_date+1,start_date+diff_date*2], [start_date+diff_date*2+1,start_date+diff_date*3], [start_date+diff_date*2+1,end_date]]
        if href_flag == true then
            calendar_html = "<tr style='font-size:12px;'><td><a href='/tasks/#{task.id}' class='btn btn-warning btn-sm' style='width:150px;font-size:12px;color:white;'>" + task.t_name + "</a></td>"
        else 
            calendar_html = "<tr style='font-size:12px;'><td><a class='btn btn-warning btn-sm' style='width:150px;font-size:12px;color:white;'>" + task.t_name + "</a></td>"
        end
        c_counter = 0
        w_date_array.each do |w_date|
            if t_start_date.between?(w_date[0], w_date[1]) then
                if href_flag == true then
                    calendar_html += "<td class='alert alert-info'><a href='/tasks/#{task.id}'><i class='fas fa-user-circle'></i>　" + task.role + "　" + task.end_date.to_s + "まで</a>"
                else
                    calendar_html += "<td class='alert alert-info'><i class='fas fa-user-circle'></i>　" + task.role + "　" + task.end_date.to_s + "まで<br><a style='color:white;' class='btn btn-sm btn-danger calendar-card-btn'>削除</a>　<a style='color:white;' class='btn btn-sm btn-success calendar-card-btn'>編集</a>"
                end
                if t_end_date.between?(w_date[0], w_date[1]) then
                    calendar_html += "</td>"
                end
            else
                calendar_html += "<td></td>"
            end
            c_counter += 1
        end
        calendar_html += "</tr>"

        return calendar_html.html_safe
    end
end
