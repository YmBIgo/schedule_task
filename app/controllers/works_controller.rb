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
        @recent_tasks = @work.tasks.where.not(:parent_task_id => 0).order(start_date: "ASC").limit(4)
        @recent_task_top = Task.find_by(:parent_task_id => 0, :t_number => @recent_tasks.first.t_number)
        @persons = Person.all.order(:id)
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

        task_collection = TaskCollection.new([
            {"t_name" => "合宿下準備","role" => "幹事1", "parent_task_id" => 0,"before_date" => 80,"date_duration" => 15,"t_number" => 1},
            {"t_name" => "要望聞き込み","role" => "幹事2", "parent_task_id" => 1,"before_date" => 80,"date_duration" => 5,"t_number" => 1},
            {"t_name" => "予算案","role" => "幹事1", "parent_task_id" => 1,"before_date" => 75,"date_duration" => 5,"t_number" => 1},
            {"t_name" => "行き先決定","role" => "幹事1", "parent_task_id" => 1,"before_date" => 70,"date_duration" => 5,"t_number" => 1},
            {"t_name" => "詳細決め","role" => "幹事1", "parent_task_id" => 0,"before_date" => 65,"date_duration" => 34,"t_number" => 2},
            {"t_name" => "宿泊施設決定","role" => "飲み会", "parent_task_id" => 2,"before_date" => 65,"date_duration" => 10,"t_number" => 2},
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
            {"t_name" => "参加者リスト","role" => "幹事1", "parent_task_id" => 1,"before_date" => 80,"date_duration" => 5,"t_number" => 1},
            {"t_name" => "日程確認","role" => "幹事1", "parent_task_id" => 1,"before_date" => 75,"date_duration" => 5,"t_number" => 1},
            {"t_name" => "会場決め","role" => "幹事1", "parent_task_id" => 1,"before_date" => 70,"date_duration" => 5,"t_number" => 1},
            {"t_name" => "日程決定","role" => "幹事1", "parent_task_id" => 1,"before_date" => 70,"date_duration" => 5,"t_number" => 1},
            {"t_name" => "下見","role" => "幹事1", "parent_task_id" => 0,"before_date" => 65,"date_duration" => 34,"t_number" => 2},
            {"t_name" => "下見","role" => "幹事1", "parent_task_id" => 2,"before_date" => 65,"date_duration" => 10,"t_number" => 2},
            {"t_name" => "料理・ドリンク決定","role" => "幹事1", "parent_task_id" => 2,"before_date" => 55,"date_duration" => 15,"t_number" => 2},
            {"t_name" => "予約","role" => "幹事1", "parent_task_id" => 0,"before_date" => 50,"date_duration" => 5,"t_number" => 3},
            {"t_name" => "予約","role" => "幹事1", "parent_task_id" => 3,"before_date" => 31,"date_duration" => 30,"t_number" => 3},
            {"t_name" => "案内","role" => "幹事1", "parent_task_id" => 0,"before_date" => 26,"date_duration" => 5,"t_number" => 4},
            {"t_name" => "タイムスケジュール","role" => "幹事1", "parent_task_id" => 4,"before_date" => 21,"date_duration" => 5,"t_number" => 4},
            {"t_name" => "席順","role" => "幹事1", "parent_task_id" => 4,"before_date" => 5,"date_duration" => 5,"t_number" => 4},
            {"t_name" => "二次会確認","role" => "幹事1", "parent_task_id" => 4,"before_date" => 0,"date_duration" => 1,"t_number" => 4},
            {"t_name" => "会費徴収","role" => "幹事1", "parent_task_id" => 4,"before_date" => 0,"date_duration" => 1,"t_number" => 4},
            {"t_name" => "メール・LINE連絡","role" => "幹事1", "parent_task_id" => 4,"before_date" => 0,"date_duration" => 1,"t_number" => 4},
            {"t_name" => "最終確認連絡","role" => "幹事1", "parent_task_id" => 4,"before_date" => 0,"date_duration" => 1,"t_number" => 4},
            {"t_name" => "当日","role" => "幹事1", "parent_task_id" => 0,"before_date" => 0,"date_duration" => 1,"t_number" => 5},
            {"t_name" => "最終連絡","role" => "幹事1", "parent_task_id" => 5,"before_date" => 0,"date_duration" => 1,"t_number" => 5},
            {"t_name" => "追加徴収","role" => "幹事1", "parent_task_id" => 5,"before_date" => 0,"date_duration" => 1,"t_number" => 5},
            {"t_name" => "二次会","role" => "幹事1", "parent_task_id" => 5,"before_date" => 0,"date_duration" => 1,"t_number" => 5}
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