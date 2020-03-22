require "securerandom"

class WorksController < ApplicationController

    def new
        # binding.pry
        @today = Time.parse(params["start-date"])
        if params["schedule-type"] == "合宿" then
            @tasks = generate_gassyuku_tasks()
        elsif params["schedule-type"] == "飲み会" then
            @tasks = generate_nomikai_tasks()
        else
            @tasks = generate_normal_tasks()
        end
        @task = TaskCollection.new
        @work  = Work.new
    end

    def show
        @work = Work.find_by(:w_url => params[:id])
        @tasks = @work.tasks
        # @recent_tasks = @work.tasks.where.not(:parent_task_id => 0).where('end_date <= ?', Date.today+7).limit(4)
        @recent_tasks = @work.tasks.where.not(:parent_task_id => 0).order(end_date: "ASC").limit(4)
        @recent_task_top = Task.find_by(:parent_task_id => 0, :t_number => @recent_tasks.first.t_number)
        @persons = @work.tasks.pluck(:role).uniq
        @late_tasks = Task.where('end_date <= ?', Date.today+1).limit(3)
    end

    def index
    end

    def create
        @work = Work.new(work_params)
        @tasks = TaskCollection.new(task_params)
        while (work_url = SecureRandom.hex(10))
            if Work.find_by(:w_url => work_url) == nil then
                @work.update(:w_url => work_url, :w_percent => 0)
                break
            end
        end
        if @work.save then
            if @tasks.save(@work.id) then
                redirect_to "/works/#{@work.w_url}"
            end
        end
    end

    private
    def generate_gassyuku_tasks()
        # 書けないデータ
        # parent_task_id / following_task_id / t_number / work_id / person_id

        # ゆったり日程を決める 80日プラン / そこそこ 60日 / 急ぎ 45日
        # で、before_date / date_duration を変える

        # ,"reference_url" => "", "reference_text" => "", "reference_image" => ""

        task_collection = TaskCollection.new([
            {"t_name" => "合宿下準備","role" => "幹事1", "parent_task_id" => 0,"before_date" => 80,"date_duration" => 15,"t_number" => 1},
            {"t_name" => "要望聞き込み","role" => "幹事2", "parent_task_id" => 1,"before_date" => 80,"date_duration" => 5,"t_number" => 1, "reference_url" => "https://www.google.com/intl/ja_jp/forms/about/", "reference_text" => "Google フォーム", "reference_image" => "https://www.google.com/url?sa=i&url=https%3A%2F%2Fthe-lead-biz.com%2Fhow-to-use-google-form%2F&psig=AOvVaw33NqYFWGL3gY3J2INIJ-er&ust=1584896570145000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKC1w_qFrOgCFQAAAAAdAAAAABAD"},
            {"t_name" => "予算案","role" => "幹事1", "parent_task_id" => 1,"before_date" => 75,"date_duration" => 5,"t_number" => 1},
            {"t_name" => "行き先決定","role" => "幹事1", "parent_task_id" => 1,"before_date" => 70,"date_duration" => 5,"t_number" => 1},
            {"t_name" => "詳細決め","role" => "幹事1", "parent_task_id" => 0,"before_date" => 65,"date_duration" => 34,"t_number" => 2},
            {"t_name" => "宿泊施設決定","role" => "飲み会", "parent_task_id" => 2,"before_date" => 65,"date_duration" => 10,"t_number" => 2, "reference_url" => "https://www.tabiplan.co.jp/", "reference_text" => "スポーツ合宿と音楽・ゼミ合宿にお勧めの宿【旅プラン】", "reference_image" => "https://scheduletask.s3-ap-northeast-1.amazonaws.com/images/reference/gassyuku/Gassyuku_Syukuhaku.png"},
            {"t_name" => "企画決め","role" => "飲み会", "parent_task_id" => 2,"before_date" => 55,"date_duration" => 15,"t_number" => 2},
            {"t_name" => "交通手段決め","role" => "予算", "parent_task_id" => 2,"before_date" => 50,"date_duration" => 5,"t_number" => 2},
            {"t_name" => "企画発表","role" => "幹事1", "parent_task_id" => 0,"before_date" => 31,"date_duration" => 30,"t_number" => 3},
            {"t_name" => "参加者決め","role" => "幹事2", "parent_task_id" => 3,"before_date" => 26,"date_duration" => 5,"t_number" => 3},
            {"t_name" => "出欠確認","role" => "飲み会", "parent_task_id" => 3,"before_date" => 21,"date_duration" => 5,"t_number" => 3},
            {"t_name" => "保険","role" => "飲み会", "parent_task_id" => 3,"before_date" => 5,"date_duration" => 5,"t_number" => 3},
            {"t_name" => "当日スケジュール","role" => "幹事1", "parent_task_id" => 0,"before_date" => 0,"date_duration" => 1,"t_number" => 4},
            {"t_name" => "バス","role" => "幹事1", "parent_task_id" => 4,"before_date" => 0,"date_duration" => 1,"t_number" => 4},
            {"t_name" => "集金","role" => "予算", "parent_task_id" => 4,"before_date" => 0,"date_duration" => 1,"t_number" => 4},
            {"t_name" => "飲み会","role" => "飲み会", "parent_task_id" => 4,"before_date" => 0,"date_duration" => 1,"t_number" => 4}
            ])
        return task_collection
    end

    def generate_normal_tasks()
        task_collection = TaskCollection.new([
            {"t_name" => "大項目","role" => "幹事1", "parent_task_id" => 0,"before_date" => 50,"date_duration" => 15,"t_number" => 1},
            {"t_name" => "小項目","role" => "幹事1", "parent_task_id" => 1,"before_date" => 45,"date_duration" => 5,"t_number" => 1},
            {"t_name" => "小項目","role" => "幹事1", "parent_task_id" => 1,"before_date" => 40,"date_duration" => 5,"t_number" => 1},
            {"t_name" => "小項目","role" => "幹事1", "parent_task_id" => 1,"before_date" => 40,"date_duration" => 5,"t_number" => 1},
            {"t_name" => "大項目","role" => "幹事1", "parent_task_id" => 0,"before_date" => 35,"date_duration" => 15,"t_number" => 2},
            {"t_name" => "小項目","role" => "幹事1", "parent_task_id" => 2,"before_date" => 30,"date_duration" => 5,"t_number" => 2},
            {"t_name" => "小項目","role" => "幹事1", "parent_task_id" => 2,"before_date" => 30,"date_duration" => 5,"t_number" => 2},
            {"t_name" => "小項目","role" => "幹事1", "parent_task_id" => 2,"before_date" => 25,"date_duration" => 5,"t_number" => 2},
            {"t_name" => "大項目","role" => "幹事1", "parent_task_id" => 0,"before_date" => 20,"date_duration" => 20,"t_number" => 3},
            {"t_name" => "小項目","role" => "幹事1", "parent_task_id" => 3,"before_date" => 15,"date_duration" => 5,"t_number" => 3},
            {"t_name" => "小項目","role" => "幹事1", "parent_task_id" => 3,"before_date" => 10,"date_duration" => 5,"t_number" => 3},
            {"t_name" => "小項目","role" => "幹事1", "parent_task_id" => 3,"before_date" =>  5,"date_duration" => 5,"t_number" => 3},
            {"t_name" => "大項目","role" => "幹事1", "parent_task_id" => 0,"before_date" =>  0,"date_duration" => 1,"t_number" => 4},
            {"t_name" => "小項目","role" => "幹事1", "parent_task_id" => 4,"before_date" =>  0,"date_duration" => 1,"t_number" => 4},
            {"t_name" => "小項目","role" => "幹事1", "parent_task_id" => 4,"before_date" =>  0,"date_duration" => 1,"t_number" => 4},
            {"t_name" => "小項目","role" => "幹事1", "parent_task_id" => 4,"before_date" =>  0,"date_duration" => 1,"t_number" => 4}
        ]);
        return task_collection
    end

    def generate_nomikai_tasks()
        task_collection = TaskCollection.new([
            {"t_name" => "日程決め","role" => "幹事1", "parent_task_id" => 0,"before_date" => 80,"date_duration" => 15,"t_number" => 1},
            {"t_name" => "参加者リスト","role" => "幹事1", "parent_task_id" => 1,"before_date" => 80,"date_duration" => 5,"t_number" => 1, "reference_text" => "Google フォーム", "reference_image" => "https://www.google.com/url?sa=i&url=https%3A%2F%2Fthe-lead-biz.com%2Fhow-to-use-google-form%2F&psig=AOvVaw33NqYFWGL3gY3J2INIJ-er&ust=1584896570145000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCKC1w_qFrOgCFQAAAAAdAAAAABAD"},
            {"t_name" => "日程確認","role" => "幹事1", "parent_task_id" => 1,"before_date" => 75,"date_duration" => 5,"t_number" => 1,"reference_url" => "https://chouseisan.com/", "reference_text" => "調整さん", "reference_image" => "https://scheduletask.s3-ap-northeast-1.amazonaws.com/images/reference/gassyuku/chouseisan-og.png"},
            {"t_name" => "会場決め","role" => "幹事1", "parent_task_id" => 1,"before_date" => 70,"date_duration" => 5,"t_number" => 1,"reference_url" => "https://www.hotpepper.jp/smart_kanji/", "reference_text" => "スマート幹事", "reference_image" => "https://rr.img.naver.jp/mig?src=http%3A%2F%2Fimgcc.naver.jp%2Fkaze%2Fmission%2FUSER%2F20181005%2F13%2F10170273%2F7%2F928x414xb7f96d4193721dcfffddcd1a.jpg&twidth=1000&theight=0&qlt=80&res_format=jpg&op=r"},
            {"t_name" => "日程決定","role" => "幹事1", "parent_task_id" => 1,"before_date" => 70,"date_duration" => 5,"t_number" => 1,"reference_url" => "https://chouseisan.com/", "reference_text" => "調整さん", "reference_image" => "https://scheduletask.s3-ap-northeast-1.amazonaws.com/images/reference/gassyuku/chouseisan-og.png"},
            {"t_name" => "下見","role" => "幹事1", "parent_task_id" => 0,"before_date" => 65,"date_duration" => 34,"t_number" => 2},
            {"t_name" => "下見","role" => "幹事1", "parent_task_id" => 2,"before_date" => 65,"date_duration" => 10,"t_number" => 2},
            {"t_name" => "料理・ドリンク決定","role" => "幹事1", "parent_task_id" => 2,"before_date" => 55,"date_duration" => 15,"t_number" => 2},
            {"t_name" => "予約","role" => "幹事1", "parent_task_id" => 2,"before_date" => 50,"date_duration" => 18,"t_number" => 2,"reference_url" => "https://www.hotpepper.jp/smart_kanji/", "reference_text" => "スマート幹事", "reference_image" => "https://rr.img.naver.jp/mig?src=http%3A%2F%2Fimgcc.naver.jp%2Fkaze%2Fmission%2FUSER%2F20181005%2F13%2F10170273%2F7%2F928x414xb7f96d4193721dcfffddcd1a.jpg&twidth=1000&theight=0&qlt=80&res_format=jpg&op=r"},
            {"t_name" => "案内","role" => "幹事1", "parent_task_id" => 0,"before_date" => 26,"date_duration" => 5,"t_number" => 3},
            {"t_name" => "タイムスケジュール","role" => "幹事1", "parent_task_id" => 3,"before_date" => 21,"date_duration" => 5,"t_number" => 3, "reference_url" => "https://shinkohyo.com/", "reference_text" => "進行表さん", "reference_image" => "https://image.news.livedoor.com/newsimage/0/a/0a3c9_1477_f8effb5c_15580a16.png"},
            {"t_name" => "席順","role" => "幹事1", "parent_task_id" => 3,"before_date" => 18,"date_duration" => 7,"t_number" => 3},
            {"t_name" => "二次会確認","role" => "幹事1", "parent_task_id" => 3,"before_date" => 10,"date_duration" => 3,"t_number" => 3, "reference_url" => "https://tabelog.com/", "reference_text" => "食べログ", "reference_image" => "https://image.itmedia.co.jp/business/articles/1910/17/l_kstabe0.jpg"},
            {"t_name" => "会費徴収","role" => "幹事1", "parent_task_id" => 3,"before_date" => 20,"date_duration" => 10,"t_number" => 3, "reference_url" => "https://apps.apple.com/jp/app/%E5%89%B2%E3%82%8A%E5%8B%98%E3%81%97%E3%81%BE%E3%81%97%E3%82%87/id665785271", "reference_text" => "割り勘しましょ", "reference_image" => "https://party-organizer.tokyo/wp-content/uploads/2018/05/warikansimasyo-e1528243121105.png"},
            {"t_name" => "メール・LINE連絡","role" => "幹事1", "parent_task_id" => 3,"before_date" => 15,"date_duration" => 5,"t_number" => 3, "reference_url" => "https://www.line.me", "reference_text" => "LINE", "reference_image" => "https://d.line-scdn.net/stf/line-lp/1200x630.png"},
            {"t_name" => "最終確認連絡","role" => "幹事1", "parent_task_id" => 3,"before_date" => 7,"date_duration" => 3,"t_number" => 3},
            {"t_name" => "当日","role" => "幹事1", "parent_task_id" => 0,"before_date" => 0,"date_duration" => 1,"t_number" => 4},
            {"t_name" => "最終連絡","role" => "幹事1", "parent_task_id" => 4,"before_date" => 0,"date_duration" => 1,"t_number" => 4},
            {"t_name" => "追加徴収","role" => "幹事1", "parent_task_id" => 4,"before_date" => 0,"date_duration" => 1,"t_number" => 4},
            {"t_name" => "二次会","role" => "幹事1", "parent_task_id" => 4,"before_date" => 0,"date_duration" => 1,"t_number" => 4}
        ]);
        return task_collection
    end

    def work_params
        params.require(:work).permit(:w_name)
    end
    def task_params
        params.require(:tasks)
    end

end