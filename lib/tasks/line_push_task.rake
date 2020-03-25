require 'line-bot-api'

namespace :line_push_task do

    top_level = self

    using Module.new {
        refine(top_level.singleton_class) do
          def send_line_message(line_id, message)
            puts(line_id, "に、「", message, "」を送信します")
            message = {
                to: line_id,
                type: "text",
                text: message
            }
            client = Line::Bot::Client.new { |config|
                config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
                config.channel_token  = ENV["LINE_CHANNEL_TOKEN"]
            }
            response = client.push_message(ENV["LINE_CHANNEL_ID"], message)
            puts response    
          end
        end
    }

    desc "LINE 通知を Push します"
    task push_line_message_todo: :environment do |task, args|
        roles = Role.where(:is_line_friend => true)
        # roles.each do |role|
            # task_message = "@#{role.line_id}さんの予定\n\n"
            task_message = "直近の用事がありますよ"
            # work = Work.find(role.work_id)
            # tasks = work.tasks
            # line_tasks = tasks.where(:line_push_date => Date.today.in_time_zone.all_day)
            # line_tasks.each do |l_task|
            #     task_message += l_task.t_name + " @" + l_task.start_date.to_s + " \n"
            # end
            send_line_message(role.first.line_id, task_message)
        # end
    end
end
