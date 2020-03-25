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
        elsif input_word == "赤ちゃん予防接種"
            tasks = generate_baby_vaccination_tasks()
        elsif input_word == "子供イベント運営"
            tasks = generate_kids_event_basic_tasks()
        elsif input_word == "結婚" then
            tasks = generate_wedding_tasks()
        elsif input_word == "相続" then
            tasks = generate_inheritance_tasks()
        elsif input_word == "引越し" then
            tasks = generate_housemoving_tasks()
        elsif input_word == "マイホーム購入" then
            tasks = generate_myhome_tasks()
        elsif input_word == "IT補助金" then
            tasks = generate_it_subsidy_tasks()
        elsif input_word == "飲食店開業" then
            tasks = generate_open_restrant_tasks()
        elsif input_word == "就活" then
            tasks = generate_recruit_tasks()
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

    # 結婚
    def generate_wedding_tasks()
        tc_itsub = generate_public_taskcollection("schedule/lifeevent/wedding/wedding.json")
        return tc_itsub      
    end

    # 赤ちゃん予防接種
    def generate_baby_vaccination_tasks()
        tc_babyv = generate_public_taskcollection("schedule/lifeevent/baby/vaccination.json")
        return tc_babyv
    end

    def generate_kids_event_basic_tasks()
        tc_kids_event_basic = generate_public_taskcollection("schedule/lifeevent/school/kids_event.json")
        return tc_kids_event_basic
    end

    # 就活
    def generate_recruit_tasks()
        tc_recruit = generate_public_taskcollection("schedule/work/job_hunting/recruit.json")
        return tc_recruit
    end

    # 引越し
    def generate_housemoving_tasks()
        tc_house_moving = generate_public_taskcollection("schedule/lifeevent/house/house_moving.json")
        return tc_house_moving
    end

    # マイホーム
    def generate_myhome_tasks()
        tc_gassyuku = generate_public_taskcollection("schedule/lifeevent/house/myhome.json")
        return tc_gassyuku
    end

    # 相続
    def generate_inheritance_tasks()
        tc_itsub = generate_public_taskcollection("schedule/lifeevent/disease/inheritance.json")
        return tc_itsub
    end

    # IT補助金
    def generate_it_subsidy_tasks()
        tc_itsub = generate_public_taskcollection("schedule/work/entrepreneur/subsidy.json")
        return tc_itsub      
    end

    def generate_open_restrant_tasks()
        tc_open_restaurant = generate_public_taskcollection("schedule/work/entrepreneur/open_restaurant.json")
    end
    
    # 合宿
    def generate_gassyuku_tasks()
        tc_gassyuku = generate_public_taskcollection("schedule/lifeevent/school/gassuku.json")
        return tc_gassyuku
    end

    # 飲み会
    def generate_nomikai_tasks()
        tc_nomi = generate_public_taskcollection("schedule/work/company/nomikai.json")
        return tc_nomi
    end

end
