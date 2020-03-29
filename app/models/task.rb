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
        if input_word == "合宿" then
            tasks = generate_gassyuku_tasks()
        elsif input_word == "飲み会" then
            tasks = generate_nomikai_tasks()
        elsif input_word == "赤ちゃん予防接種" then
            tasks = generate_baby_vaccination_tasks()
        elsif input_word == "子供イベント運営" then
            tasks = generate_kids_event_basic_tasks()
        elsif input_word == "幼稚園バザー運営" then
            tasks = generate_kids_bazaar_tasks()
        elsif input_word == "結婚" then
            tasks = generate_wedding_tasks()
        elsif input_word == "離婚" then
            tasks = generate_divorce_tasks()
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
        elsif input_word == "IT導入" then
            tasks = generate_it_application_tasks()
        elsif input_word == "オフィス移転" then
            tasks = generate_new_office_tasks()
        elsif input_word == "イベント運営" then
            tasks = generate_event_operation_tasks()
        elsif input_word == "海外展示会" then
            tasks = generate_foreign_exhibition_tasks()

        # 海外進出

        elsif input_word == "法人米国進出" then
            tasks = generate_us_company_tasks()
        elsif input_word == "法人ドイツ進出" then
            tasks = generate_german_company_tasks()
        elsif input_word == "法人中国進出" then
            tasks = generate_china_company_tasks()
        elsif input_word == "法人タイ進出" then
            tasks = generate_thai_company_tasks()
        elsif input_word == "法人フィリピン進出" then
            tasks = generate_philippine_company_tasks()

        # 開業

        elsif input_word == "医院開業"
            tasks = generate_open_doctor_tasks()
        elsif input_word == "飲食店開業" then
            tasks = generate_open_restrant_tasks()
        elsif input_word == "サロン開業" then
            tasks = generate_open_salon_tasks()     

        # 労務業務

        elsif input_word == "労務業務１〜３月" then
            tasks = generate_labor_quater1_tasks()
        elsif input_word == "労務業務４〜６月" then
            tasks = generate_labor_quater2_tasks()  
        elsif input_word == "労務業務７〜９月" then
            tasks = generate_labor_quater3_tasks()  
        elsif input_word == "労務業務１０〜１２月" then
            tasks = generate_labor_quater4_tasks()  

        # 経理業務

        elsif input_word == "経理業務１〜２月" then
            tasks = generate_accounting_1_2_tasks()  
        elsif input_word == "経理業務３〜４月" then
            tasks = generate_accounting_3_4_tasks()  
        elsif input_word == "経理業務５〜６月" then
            tasks = generate_accounting_5_6_tasks()  
        elsif input_word == "経理業務７〜８月" then
            tasks = generate_accounting_7_8_tasks()  
        elsif input_word == "経理業務９〜１０月" then
            tasks = generate_accounting_9_10_tasks()  
        elsif input_word == "経理業務１１〜１２月" then
            tasks = generate_accounting_11_12_tasks()  

        # 人事業務
        # 人事評価　４〜７月 / ８〜１１月 / １２〜３月　　人事教育研修　４〜９月 / １０〜３月
        # 人事労務管理４月〜３月　　人事法定業務　４〜６月 / ７〜９月 １０〜１２月 / １〜３月

        elsif input_word == "人事評価４〜７月" then
            tasks = generate_hr_evaliation_1third_tasks()
        elsif input_word == "人事評価８〜１１月" then
            tasks = generate_hr_evaliation_2third_tasks()
        elsif input_word == "人事評価１２〜３月" then
            tasks = generate_hr_evaliation_3third_tasks()
        elsif input_word == "人事教育研修４〜９月" then
            tasks = generate_hr_education_1half_tasks()  
        elsif input_word == "人事教育研修１０〜３月" then
            tasks = generate_hr_education_2half_tasks()  
        elsif input_word == "人事労務管理４月〜３月" then
            tasks = generate_hr_work_management_tasks()  
        elsif input_word == "人事法定業務４〜６月" then
            tasks = generate_hr_work_law_1quater_tasks()  
        elsif input_word == "人事法定業務７〜９月" then
            tasks = generate_hr_work_law_2quater_tasks()  
        elsif input_word == "人事法定業務１０〜１２月" then
            tasks = generate_hr_work_law_3quater_tasks()  
        elsif input_word == "人事法定業務１〜３月" then
            tasks = generate_hr_work_law_4quater_tasks()  

        # 大学関係

        elsif input_word == "論文" then
            tasks = generate_article_tasks()
        elsif input_word == "アメリカ大学院留学" then
            tasks = generate_graduate_america()
        elsif input_word == "イギリス大学院留学" then
            tasks = generate_graduate_england()
        elsif input_word == "就活" then
            tasks = generate_recruit_tasks()
        elsif input_word == "会社就活準備" then
            tasks = generate_company_recruit_tasks()
        elsif input_word == "会社高卒採用準備" then
            tasks = generate_kosotsu_recruit_tasks()
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

# 未設定

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

    # 結婚
    def generate_wedding_tasks()
        tc_itsub = generate_public_taskcollection("schedule/lifeevent/wedding/wedding.json")
        return tc_itsub      
    end

    # 離婚
    def generate_divorce_tasks()
        tc_divorce = generate_public_taskcollection("schedule/lifeevent/wedding/divorce.json")
        return tc_divorce
    end

# お子さま

    # 赤ちゃん予防接種
    def generate_baby_vaccination_tasks()
        tc_babyv = generate_public_taskcollection("schedule/lifeevent/baby/vaccination.json")
        return tc_babyv
    end

    # バザー
    def generate_kids_bazaar_tasks()
        tc_bazaar = generate_public_taskcollection("schedule/lifeevent/baby/bazaar.json")
        return tc_bazaar
    end

    # 子供イベント　運営
    def generate_kids_event_basic_tasks()
        tc_kids_event_basic = generate_public_taskcollection("schedule/lifeevent/school/kids_event.json")
        return tc_kids_event_basic
    end

    # イベント　運営
    def generate_event_operation_tasks()
        tc_event_basic = generate_public_taskcollection("schedule/work/company/event_operation.json")
        return tc_event_basic
    end

# 採用

    # 会社採用
    def generate_company_recruit_tasks()
        tc_company_recruit = generate_public_taskcollection("schedule/work/job_hunting/company_recruit.json")
        return tc_company_recruit
    end

    # 会社高卒採用
    def generate_kosotsu_recruit_tasks()
        tc_kosotsu_recruit = generate_public_taskcollection("schedule/work/job_hunting/kosotsu_recruit.json")
        return tc_kosotsu_recruit
    end

    # 人事評価　４〜７月 / ８〜１１月 / １２〜３月　　人事教育研修　４〜９月 / １０〜３月
    # 人事労務管理４月〜３月　　人事法定業務　４〜６月 / ７〜９月 １０〜１２月 / １〜３月
    
    # 人事評価　４〜７月
    def generate_hr_evaliation_1third_tasks()
        tc_hr_evaluation1 = generate_public_taskcollection("schedule/work/company/workflow/hr/hr_evaluation_1third.json")
        return tc_hr_evaluation1
    end

    # 人事評価　８〜１１月
    def generate_hr_evaliation_2third_tasks()
        tc_hr_evaluation2 = generate_public_taskcollection("schedule/work/company/workflow/hr/hr_evaluation_2third.json")
        return tc_hr_evaluation2
    end

    # 人事評価　１２〜３月
    def generate_hr_evaliation_3third_tasks()
        tc_hr_evaluation3 = generate_public_taskcollection("schedule/work/company/workflow/hr/hr_evaluation_3third.json")
        return tc_hr_evaluation3
    end

    # 人事教育研修　４〜９月
    def generate_hr_education_1half_tasks()
        tc_hr_education1 = generate_public_taskcollection("schedule/work/company/workflow/hr/hr_education_1half.json")
        return tc_hr_evaluation1
    end

    # 人事教育研修　１０〜３月
    def generate_hr_education_2half_tasks()
        tc_hr_education2 = generate_public_taskcollection("schedule/work/company/workflow/hr/hr_education_2half.json")
        return tc_hr_evaluation2
    end

    # 人事労務管理　４〜３月
    def generate_hr_work_management_tasks()
        tc_hr_content = generate_public_taskcollection("schedule/work/company/workflow/hr/hr_work_management.json")
        return tc_hr_content
    end

    # 人事法定業務　４〜６月
    def generate_hr_work_law_1quater_tasks()
        tc_hr_content = generate_public_taskcollection("schedule/work/company/workflow/hr/hr_work_law_1quater.json")
        return tc_hr_content
    end

    # 人事法定業務　７〜９月
    def generate_hr_work_law_2quater_tasks()
        tc_hr_content = generate_public_taskcollection("schedule/work/company/workflow/hr/hr_work_law_2quater.json")
        return tc_hr_content
    end

    # 人事法定業務　１０〜１２月
    def generate_hr_work_law_3quater_tasks()
        tc_hr_content = generate_public_taskcollection("schedule/work/company/workflow/hr/hr_work_law_3quater.json")
        return tc_hr_content
    end

    # 人事法定業務　１〜３月
    def generate_hr_work_law_4quater_tasks()
        tc_hr_content = generate_public_taskcollection("schedule/work/company/workflow/hr/hr_work_law_4quater.json")
        return tc_hr_content
    end

# 大学

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

# 海外進出

    # 海外展示会
    def generate_foreign_exhibition_tasks()
        tc_foreign_exhibition = generate_public_taskcollection("schedule/work/company/foreign_exhibition.json")
        return tc_foreign_exhibition
    end

    # 米国進出
    def generate_us_company_tasks()
        tc_us_company = generate_public_taskcollection("schedule/work/office/foreign/us.json")
        return tc_us_company
    end

    # ドイツ進出
    def generate_german_company_tasks()
        tc_german_company = generate_public_taskcollection("schedule/work/office/foreign/german.json")
        return tc_german_company
    end
    
    # 中国進出
    def generate_china_company_tasks()
        tc_china_company = generate_public_taskcollection("schedule/work/office/foreign/china.json")
        return tc_china_company
    end

    # タイ進出
    def generate_thai_company_tasks()
        tc_thai_company = generate_public_taskcollection("schedule/work/office/foreign/thai.json")
        return tc_thai_company
    end

    # フィリピン進出
    def generate_philippine_company_tasks()
        tc_philippine_company = generate_public_taskcollection("schedule/work/office/foreign/philippine.json")
        return tc_philippine_company
    end

# くらし

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

# 不動産

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

# 法律

    # 相続
    def generate_inheritance_tasks()
        tc_itsub = generate_public_taskcollection("schedule/lifeevent/disease/inheritance.json")
        return tc_itsub
    end

# IT

    # IT導入
    def generate_it_application_tasks()
        tc_it_application = generate_public_taskcollection("schedule/work/company/application_it.json")
        return tc_it_application
    end

# 助成金

    # IT補助金
    def generate_it_subsidy_tasks()
        tc_itsub = generate_public_taskcollection("schedule/work/entrepreneur/subsidy.json")
        return tc_itsub      
    end

# 

    # オフィス移転
    def generate_new_office_tasks()
        tc_new_office = generate_public_taskcollection("schedule/work/office/new_office.json")
        return tc_new_office
    end

# 労務

    # 労務１
    def generate_labor_quater1_tasks()
        tc_labor_quater1 = generate_public_taskcollection("schedule/work/company/workflow/labor/labor_quater1.json")
        return tc_labor_quater1
    end

    # 労務２
    def generate_labor_quater2_tasks()
        tc_labor_quater2 = generate_public_taskcollection("schedule/work/company/workflow/labor/labor_quater2.json")
        return tc_labor_quater2
    end

    # 労務３
    def generate_labor_quater3_tasks()
        tc_labor_quater3= generate_public_taskcollection("schedule/work/company/workflow/labor/labor_quater3.json")
        return tc_labor_quater3
    end

    # 労務４
    def generate_labor_quater4_tasks()
        tc_labor_quater4 = generate_public_taskcollection("schedule/work/company/workflow/labor/labor_quater4.json")
        return tc_labor_quater4
    end

# 経理

    # 経理１
    def generate_accounting_1_2_tasks()
        tc_accouting_1_2 = generate_public_taskcollection("schedule/work/company/workflow/accounting/accounting_1_2.json")
        return tc_accouting_1_2
    end

    # 経理２
    def generate_accounting_3_4_tasks()
        tc_accouting_3_4 = generate_public_taskcollection("schedule/work/company/workflow/accounting/accounting_3_4.json")
        return tc_accouting_3_4
    end

     # 経理３
     def generate_accounting_5_6_tasks()
        tc_accouting_5_6 = generate_public_taskcollection("schedule/work/company/workflow/accounting/accounting_5_6.json")
        return tc_accouting_5_6
    end   

    # 経理４
    def generate_accounting_7_8_tasks()
        tc_accouting_7_8 = generate_public_taskcollection("schedule/work/company/workflow/accounting/accounting_7_8.json")
        return tc_accouting_7_8
    end

    # 経理５
    def generate_accounting_9_10_tasks()
        tc_accouting_9_10 = generate_public_taskcollection("schedule/work/company/workflow/accounting/accounting_9_10.json")
        return tc_accouting_9_10
    end

    # 経理６
    def generate_accounting_11_12_tasks()
        tc_accouting_11_12 = generate_public_taskcollection("schedule/work/company/workflow/accounting/accounting_11_12.json")
        return tc_accouting_11_12
    end

# 開業

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

    # サロン開業
    def generate_open_salon_tasks()
        tc_open_salon = generate_public_taskcollection("schedule/work/entrepreneur/open_salon.json")
        return tc_open_salon
    end

end
