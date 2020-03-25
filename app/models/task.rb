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
        elsif input_word == "赤ちゃん予防接種" then
            tasks = generate_baby_vaccination_tasks()
        elsif input_word == "子供イベント運営" then
            tasks = generate_kids_event_basic_tasks()
        elsif input_word == "結婚" then
            tasks = generate_wedding_tasks()
        elsif input_word == "相続" then
            tasks = generate_inheritance_tasks()
        elsif input_word == "引越し" then
            tasks = generate_housemoving_tasks()
        elsif input_word == "新居インテリア" then
            tasks = generate_interior_tasks()
        elsif input_word == "マイホーム購入" then
            tasks = generate_myhome_tasks()
        elsif input_word == "中古マンション購入" then
            tasks = generate_old_mansion()
        elsif input_word == "マンション修繕工事" then
            tasks = generate_repair_mansion()
        elsif input_word == "デイサービス事業所開設" then
            tasks = generate_open_daycare_tasks()
        elsif input_word == "IT補助金" then
            tasks = generate_it_subsidy_tasks()
        elsif input_word == "オフィス移転" then
            tasks = generate_new_office_tasks()
        elsif input_word == "医院開業"
            tasks = generate_open_doctor_tasks()
        elsif input_word == "飲食店開業" then
            tasks = generate_open_restrant_tasks()
        elsif input_word == "論文" then
            tasks = generate_article_tasks()
        elsif input_word == "アメリカ大学院留学" then
            tasks = generate_graduate_america()
        elsif input_word == "イギリス大学院留学" then
            tasks = generate_graduate_england()
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

    # 子供イベント　運営
    def generate_kids_event_basic_tasks()
        tc_kids_event_basic = generate_public_taskcollection("schedule/lifeevent/school/kids_event.json")
        return tc_kids_event_basic
    end

    # 就活
    def generate_recruit_tasks()
        tc_recruit = generate_public_taskcollection("schedule/work/job_hunting/recruit.json")
        return tc_recruit
    end

    # 論文
    def generate_article_tasks()
        tc_article = generate_public_taskcollection("schedule/lifeevent/school/article.json")
        return tc_article
    end

    # 大学院留学　アメリカ
    def generate_graduate_america()
        tc_graduate_america = generate_public_taskcollection("schedule/lifeevent/school/study_graduateschool_america.json")
        return tc_graduate_america
    end

    # 大学院留学　イギリス
    def generate_graduate_england()
        tc_graduate_america = generate_public_taskcollection("schedule/lifeevent/school/study_graduateschool_england.json")
        return tc_graduate_america
    end

    # 引越し
    def generate_housemoving_tasks()
        tc_house_moving = generate_public_taskcollection("schedule/lifeevent/house/house_moving.json")
        return tc_house_moving
    end

    # 新居インテリア
    def generate_interior_tasks()
        tc_interior = generate_public_taskcollection("schedule/lifeevent/house/interior.json")
        return tc_interior
    end

    # マイホーム
    def generate_myhome_tasks()
        tc_gassyuku = generate_public_taskcollection("schedule/lifeevent/house/myhome.json")
        return tc_gassyuku
    end

    # 中古マンション
    def generate_old_mansion()
        tc_old_mansion = generate_public_taskcollection("schedule/lifeevent/house/old_mansion.json")
        return tc_old_mansion
    end

    # マンション修繕
    def generate_repair_mansion()
        tc_repair_mansion = generate_public_taskcollection("schedule/work/real_estate/mansion_repair.json")
        return tc_repair_mansion
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

    # オフィス移転
    def generate_new_office_tasks()
        tc_new_office = generate_public_taskcollection("schedule/work/office/new_office.json")
        return tc_new_office
    end

    # デイサービス事業所開設
    def generate_open_daycare_tasks()
        tc_daycare = generate_public_taskcollection("schedule/work/entrepreneur/daycare.json")
        return tc_daycare
    end

    # レストラン開業
    def generate_open_restrant_tasks()
        tc_open_restaurant = generate_public_taskcollection("schedule/work/entrepreneur/open_restaurant.json")
        return tc_open_restaurant
    end

    # 医院開業
    def generate_open_doctor_tasks()
        tc_open_doctor = generate_public_taskcollection("schedule/work/entrepreneur/open_doctor.json")
        return tc_open_doctor
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
