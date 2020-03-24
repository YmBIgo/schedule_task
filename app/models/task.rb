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

    def default_input(input_word)
        if input_word == "合宿" then
            tasks = generate_gassyuku_tasks()
        elsif input_word == "飲み会" then
            tasks = generate_nomikai_tasks()
        elsif input_word == "IT補助金" then
            tasks = generate_it_subsidy_tasks()
        elsif input_word == "結婚" then
            tasks = generate_wedding_tasks()
        elsif input_word == "相続" then
            tasks = generate_inheritance_tasks()
        elsif input_word == "マイホーム購入"
            tasks = generate_myhome_tasks()
        else
            tasks = generate_normal_tasks()
        end
        return tasks
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

    # 通常
    def generate_normal_tasks()
        # 書けないデータ
        # following_task_id / work_id / person_id
        # ゆったり日程を決める 80日プラン / そこそこ 60日 / 急ぎ 45日
        # で、before_date / date_duration を変える
        tc_normal = generate_public_taskcollection("schedule/general/sample.json")
        return tc_normal
    end

    # 合宿
    def generate_gassyuku_tasks()
        tc_gassyuku = generate_public_taskcollection("schedule/lifeevent/school/gassuku.json")
        return tc_gassyuku
    end

    # マイホーム
    def generate_myhome_tasks()
        tc_gassyuku = generate_public_taskcollection("schedule/lifeevent/house/myhome.json")
        return tc_gassyuku
    end

    # IT補助金
    def generate_it_subsidy_tasks()
        tc_itsub = generate_public_taskcollection("schedule/work/entrepreneur/subsidy.json")
        return tc_itsub      
    end

    # 結婚
    def generate_wedding_tasks()
        tc_itsub = generate_public_taskcollection("schedule/lifeevent/wedding/wedding.json")
        return tc_itsub      
    end

    # 
    def generate_inheritance_tasks()
        tc_itsub = generate_public_taskcollection("schedule/lifeevent/disease/inheritance.json")
        return tc_itsub
    end

    # 飲み会
    def generate_nomikai_tasks()
        tc_nomi = generate_public_taskcollection("schedule/work/company/nomikai.json")
        return tc_nomi
    end

end
