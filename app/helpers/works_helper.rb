module WorksHelper
    def year_month_date(d_date)
        r_date = d_date.strftime("%Y-%m-%d")
        return r_date
    end
    def dhx_start_date(d_date)
        g_before_date = d_date.split("-")
        g_after_date = g_before_date[2] + "-" + g_before_date[1] + "-" + g_before_date[0]
        return g_after_date
    end
    def task_schedule_to_task_calendar(task, start_date, end_date, diff_date, href_flag, on_the_day_flag, t_counter)
        t_start_date = task.start_date
        t_end_date   = task.end_date
        w_date_array = [[start_date,start_date+diff_date], [start_date+diff_date+1,start_date+diff_date*2], [start_date+diff_date*2+1,start_date+diff_date*3], [start_date+diff_date*3+1,end_date]]
        if href_flag == true then
            calendar_html = "<tr style='font-size:12px;'><td><a href='/tasks/#{task.id}' class='btn btn-warning btn-sm' style='width:150px;font-size:12px;color:white;'>" + task.t_name + "</a></td>"
        else 
            calendar_html = "<tr style='font-size:12px;'><td><button type='button' class='btn btn-warning btn-sm' id='task-item-" + t_counter.to_s + "' style='font-size:12px;color:white;width:150px;' data-toggle='modal' data-target='#exampleModal' data-startdate='" +
                            task.start_date.to_s + "' data-title='" + task.t_name + "' data-enddate='" + task.end_date.to_s + "' data-role='" + task.role + "' data-taskid='task-item-" + t_counter.to_s + "' >「" +
                            task.t_name + "」<br>を編集する</button>" + "</td>"
        end
        c_counter = 0
        if on_the_day_flag == false then

            w_date_alert_array = []
            
            w_date_array.each do |w_date|
                # if w_date[0] <= t_end_date && t_start_date <= w_date[1] then
                if w_date[0] <= t_end_date && t_start_date <= w_date[1] then
                  if [1, 2, 3].include?(w_date_alert_array[-1]) then
                      w_date_alert_array[-1] += 1
                  else
                      w_date_alert_array.push(1)
                  end
                else
                  w_date_alert_array.push(0)
                end
            end

            w_date_alert_array.each do |w_date_a|
              if w_date_a == 0 then
                  calendar_html += "<td></td>"
              else
                if href_flag == true then
                    calendar_html += "<td class='alert alert-info' id='list-item-w-#{c_counter.to_s}' colspan=#{w_date_a}><a href='/tasks/#{task.id}'><i class='fas fa-user-circle'></i>　" + task.role + "　<br><i class='fas fa-clock'></i>　" + t_start_date.to_s + "〜" + t_end_date.to_s + "</a>"
                else
                    calendar_html += "<td class='alert alert-info' id='list-item-w-#{c_counter.to_s}' colspan=#{w_date_a}><i class='fas fa-user-circle'></i>　" + task.role + "<br><i class='fas fa-clock'></i>　" + t_start_date.to_s + "〜" + t_end_date.to_s + "</td><td></td>"
                #                      "<br><br><a style='color:white;' href='javascript:' class='btn btn-sm btn-danger calendar-card-btn'>削除</a>　<a style='color:white;' href='javascript:' class='btn btn-sm btn-success calendar-card-btn'>編集</a>"
                end
              end
            end
        else
            if href_flag == true then
                calendar_html += "<td></td><td class='alert alert-info' id='list-item-w-#{c_counter.to_s}'><a href='/tasks/#{task.id}'><i class='fas fa-user-circle'></i>　" +task.role + "　<br><i class='fas fa-clock'></i>　〜" + task.end_date.to_s + "</a></td><td></td>"
            else
                calendar_html += "<td></td><td class='alert alert-info' id='list-item-w-#{c_counter.to_s}'><i class='fas fa-user-circle'></i>　" + task.role + "<br><i class='fas fa-clock'></i>　〜" + task.end_date.to_s + "</td><td></td>"
            #                     "<br><br><a style='color:white;'href='javascript:'  class='btn btn-sm btn-danger calendar-card-btn'>削除</a>　<a style='color:white;' href='javascript:' class='btn btn-sm btn-success calendar-card-btn'>編集</a></td><td></td>"
            end
            c_counter += 1
        end
        calendar_html += "</tr>"

        return calendar_html.html_safe
    end
end
