class Task < ApplicationRecord
    belongs_to :work
    belongs_to :person
    has_many :checklists

    def task_status
        if self.done == true then
            return ["完了", "success"]
        else
            return ["未完了", "danger"]
        end
    end

    def default_input(input_word)
        # fixed code
        selected_knowhow = Knowhow.find_by(:k_name => input_word)
        if selected_knowhow == nil then
            tasks = generate_public_taskcollection("schedule/general/sample.json")
        else
            tasks = generate_public_taskcollection(selected_knowhow.k_tasks_json_url)
        end

        return tasks
    end

    def taskchecklist(cd_name)
        return generate_public_taskchecklistcollection(cd_name)
    end

    private

    def generate_public_taskcollection(path)
        json_content = []
        File.open("#{Rails.public_path}/json/#{path}") do |j|
            json_content = JSON.load(j)
        end
        task_collection = TaskCollection.new(json_content)
        return task_collection   
    end

    def generate_public_taskchecklistcollection(cd_name)
        selected_knowhow = Knowhow.find_by(:k_name => self.work.w_name)
        path = selected_knowhow.k_tasks_json_url
        file_path = "#{Rails.public_path}/json/#{path}".gsub(".json", "_checklists.json")
        json_content = []
        File.open(file_path) do |j|
            json_content = JSON.load(j)
        end
        json_content.each do |j_i_content|
            if j_i_content["c_d_name"] == cd_name then
                return j_i_content
            end
        end
        return {}
    end

end
