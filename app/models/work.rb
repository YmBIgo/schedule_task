class Work < ApplicationRecord
    has_many :tasks
    belongs_to :template

    def template_name_id(work_name)
        if ["マイホーム購入", "新居インテリア", "引越し"].include?(work_name) then
            return 1
        elsif ["結婚", "離婚"].include?(work_name) then
            return 2
        elsif ["赤ちゃん予防接種", "子供イベント運営", "幼稚園バザー運営"].include?(work_name) then
            return 3
        elsif ["アメリカ大学院留学", "イギリス大学院留学"].include?(work_name) then
            return 4
        elsif ["飲食店開業", "サロン開業", "デイサービス開業", "医院開業"].include?(work_name) then
            return 5
        elsif ["飲み会", "合宿", "論文", "就活"].include?(work_name) then
            return 6
        elsif ["相続"].include?(work_name) then
            return 7
        elsif ["法人米国進出", "法人ドイツ進出", "法人中国進出", "法人タイ進出", "法人フィリピン進出"].include?(work_name) then
            return 8
        elsif ["オフィス移転", "イベント運営", "海外展示会"].include?(work_name) then
            return 9
        elsif ["会社就活準備", "会社高卒採用準備"].include?(work_name) then
            return 10
        elsif ["IT補助金"].include?(work_name) then
            return 11
        elsif ["IT導入"].include?(work_name) then
            return 12
        elsif ["労務業務１〜３月", "労務業務４〜６月"].include?(work_name) then
            return 13
        elsif ["中古マンション購入", "マンション購入"].include?(work_name) then
            return 14
        else
            return 15
        end
    end
end
