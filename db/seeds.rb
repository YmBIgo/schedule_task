# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

te1 = Template.new(:id => 1,:te_name => "すまい", :te_work_names => "マイホーム購入,新居インテリア,引越し")
te2 = Template.new(:id => 2,:te_name => "結婚", :te_work_names => "結婚,離婚")
te3 = Template.new(:id => 3,:te_name => "子供", :te_work_names => "赤ちゃん予防接種,子供イベント運営,幼稚園バザー運営")
te4 = Template.new(:id => 4,:te_name => "学校", :te_work_names => "アメリカ大学院留学,イギリス大学院留学")
te5 = Template.new(:id => 5,:te_name => "開業", :te_work_names => "飲食店開業,サロン開業,デイサービス開業,医院開業")
te6 = Template.new(:id => 6,:te_name => "学校生活", :te_work_names => "飲み会,合宿,論文,就活")
te7 = Template.new(:id => 7,:te_name => "法律", :te_work_names => "相続")
te8 = Template.new(:id => 8,:te_name => "海外進出", :te_work_names => "法人米国進出,法人ドイツ進出,法人中国進出,法人タイ進出,法人フィリピン進出")
te9 = Template.new(:id => 9,:te_name => "イベント運営", :te_work_names => "オフィス移転,イベント運営,海外展示会")
te10 = Template.new(:id => 10,:te_name => "採用", :te_work_names => "会社就活準備,会社高卒採用準備,人事評価４〜７月,人事評価８〜１１月,人事評価１２〜３月,人事教育研修４〜９月,人事教育研修１０〜３月,人事労務管理４月〜３月,人事法定業務４〜６月,人事法定業務７〜９月,人事法定業務１０〜１２月,人事法定業務１〜３月")
te11 = Template.new(:id => 11,:te_name => "助成金", :te_work_names => "IT補助金")
te12 = Template.new(:id => 12,:te_name => "ITシステム", :te_work_names => "IT導入")
te13 = Template.new(:id => 13,:te_name => "労務業務", :te_work_names => "労務業務１〜３月,労務業務４〜６月,労務業務７〜９月,労務業務１０〜１２月")
te14 = Template.new(:id => 14,:te_name => "不動産", :te_work_names => "中古マンション購入,マンション購入")
te15 = Template.new(:id => 15,:te_name => "経理業務", :te_work_names => "経理業務１〜２月,経理業務３〜４月,経理業務５〜６月,経理業務７〜８月,経理業務９〜１０月,経理業務１１〜１２月")
te100 = Template.new(:id => 100,:te_name => "不明", :te_work_names => "")

te1.save; te2.save; te3.save; te4.save; te5.save;
te6.save; te7.save; te8.save; te9.save; te10.save;
te11.save; te12.save; te13.save; te14.save; te100.save

w1 = Work.new(:w_name => "合宿1", :content => "", :w_percent => 0, :w_url => "e4376c18a4f27ef0bd5f", :email => "coffeecup_japan@icloud.com", :template_id => te6.id)
w1.save

role1 = Role.new(:workurl => w1.w_url, :email => "coffeecup_japan@icloud.com", :password => "kz48", :line_id => "igymb0218", :is_line_friend => true)
role1.save

p1 = Person.new(:p_name => "たろお", :role => "幹部1")
p2 = Person.new(:p_name => "二郎", :role => "幹部2")
p3 = Person.new(:p_name => "ヤマダ", :role => "飲み会")
p4 = Person.new(:p_name => "飯田", :role => "予算")

p1.save; p2.save; p3.save; p4.save;

t1 = Task.new(:t_name => "企画決め", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "幹事1", :parent_task_id => 0, :following_task_id => 0, :t_number => 1, :work_id => 1 ,
         :person_id => 1, :before_date => 80, :date_duration => 5)
t2 = Task.new(:t_name => "要望聞き込み", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "幹事2", :parent_task_id => 1, :following_task_id => 1, :t_number => 1, :work_id => 1 ,
         :person_id => 2, :before_date => 75, :date_duration => 5 )
t3 = Task.new(:t_name => "予算案", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "幹事1", :parent_task_id => 1, :following_task_id => 2, :t_number => 1, :work_id => 1 ,
         :person_id => 1, :before_date => 70, :date_duration => 5)
t4 = Task.new(:t_name => "行き先決定", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "幹事1", :parent_task_id => 1, :following_task_id => 3, :t_number => 1, :work_id => 1 ,
         :person_id => 1, :before_date => 70, :date_duration => 5)

t1.save; t2.save; t3.save; t4.save;

t5 = Task.new(:t_name => "詳細決め", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "幹事1", :parent_task_id => 0, :following_task_id => 4, :t_number => 2, :work_id => 1 ,
         :person_id => 1, :before_date => 65, :date_duration => 10)
t6 = Task.new(:t_name => "宿泊施設決定", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "飲み会", :parent_task_id => 2, :following_task_id => 5, :t_number => 2, :work_id => 1 ,
         :person_id => 3, :before_date => 60, :date_duration => 5 )
t7 = Task.new(:t_name => "企画決め", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "飲み会", :parent_task_id => 2, :following_task_id => 6, :t_number => 2, :work_id => 1 ,
         :person_id => 3, :before_date => 55, :date_duration => 15 )
t8 = Task.new(:t_name => "交通手段決め", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "予算", :parent_task_id => 2, :following_task_id => 7, :t_number => 2, :work_id => 1 ,
         :person_id => 4, :before_date => 50, :date_duration => 5 )

t5.save; t6.save; t7.save; t8.save;

t9 = Task.new(:t_name => "企画発表", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "幹事1", :parent_task_id => 0, :following_task_id => 8, :t_number => 3, :work_id => 1 ,
         :person_id => 1, :before_date => 30, :date_duration => 5)
t10 = Task.new(:t_name => "参加者決め", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "幹事2", :parent_task_id => 3, :following_task_id => 9, :t_number => 3, :work_id => 1 ,
         :person_id => 2, :before_date => 25, :date_duration => 5 )
t11 = Task.new(:t_name => "出欠確認", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "飲み会", :parent_task_id => 3, :following_task_id => 10, :t_number => 3, :work_id => 1 ,
         :person_id => 3, :before_date => 20, :date_duration => 5 )
t12 = Task.new(:t_name => "保険", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "飲み会", :parent_task_id => 3, :following_task_id => 11, :t_number => 3, :work_id => 1 ,
         :person_id => 3, :before_date => 5, :date_duration => 5 )

t9.save; t10.save; t11.save; t12.save;

t13 = Task.new(:t_name => "当日スケジュール", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "幹事1", :parent_task_id => 0, :following_task_id => 12, :t_number => 4, :work_id => 1 ,
         :person_id => 1, :before_date => 0, :date_duration => 1)
t14 = Task.new(:t_name => "バス", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "幹事1", :parent_task_id => 4, :following_task_id => 13, :t_number => 4, :work_id => 1 ,
         :person_id => 1, :before_date => 0, :date_duration => 1)
t15 = Task.new(:t_name => "集金", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "予算", :parent_task_id => 4, :following_task_id => 14, :t_number => 4, :work_id => 1 ,
         :person_id => 4, :before_date => 0, :date_duration => 1 )
t16 = Task.new(:t_name => "飲み会", :start_date => "2020-03-20", :end_date => "2020-03-25",
         :role => "飲み会", :parent_task_id => 4, :following_task_id => 15, :t_number => 4, :work_id => 1 ,
         :person_id => 4, :before_date => 0, :date_duration => 1 )

t13.save; t14.save; t15.save; t16.save;


