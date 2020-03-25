# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

w1 = Work.new(:w_name => "合宿1", :content => "", :w_percent => 0, :w_url => "e4376c18a4f27ef0bd5f", :email => "coffeecup_japan@icloud.com")
w1.save!

role1 = Role.new(:workurl => w1.w_url, :work_id => w1.id, :password => "kz48", :line_id => "igymb0218", :is_line_friend => true)
role1.save!

p1 = Person.new(:p_name => "たろお", :role => "幹部1")
p2 = Person.new(:p_name => "二郎", :role => "幹部2")
p3 = Person.new(:p_name => "ヤマダ", :role => "飲み会")
p4 = Person.new(:p_name => "飯田", :role => "予算")

p1.save!; p2.save!; p3.save!; p4.save!;

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

t1.save!; t2.save!; t3.save!; t4.save!;

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

t5.save!; t6.save!; t7.save!; t8.save!;

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

t9.save!; t10.save!; t11.save!; t12.save!;

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

t13.save!; t14.save!; t15.save!; t16.save!;
