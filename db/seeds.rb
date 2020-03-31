# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

te1 = Template.new(:id => 1,:te_name => "すまい", :te_work_names => "マイホーム購入,新居インテリア,引越し", :is_date_fixed => 1)
te2 = Template.new(:id => 2,:te_name => "結婚", :te_work_names => "結婚,離婚", :is_date_fixed => 1)
te3 = Template.new(:id => 3,:te_name => "子供", :te_work_names => "赤ちゃん予防接種,子供イベント運営,幼稚園バザー運営", :is_date_fixed => 1)
te4 = Template.new(:id => 4,:te_name => "学校", :te_work_names => "アメリカ大学院留学１〜９月,イギリス大学院留学１〜９月")
te5 = Template.new(:id => 5,:te_name => "開業", :te_work_names => "飲食店開業,サロン開業,デイサービス開業,医院開業", :is_date_fixed => 1)
te6 = Template.new(:id => 6,:te_name => "学校生活", :te_work_names => "飲み会,合宿,論文,就活", :is_date_fixed => 1)
te7 = Template.new(:id => 7,:te_name => "法律", :te_work_names => "相続", :is_date_fixed => 1)
te8 = Template.new(:id => 8,:te_name => "海外進出", :te_work_names => "法人米国進出,法人ドイツ進出,法人中国進出,法人タイ進出,法人フィリピン進出", :is_date_fixed => 1)
te9 = Template.new(:id => 9,:te_name => "イベント運営", :te_work_names => "オフィス移転,イベント運営,海外展示会", :is_date_fixed => 1)
te10 = Template.new(:id => 10,:te_name => "採用", :te_work_names => "会社就活準備６〜４月,会社高卒採用準備１〜３月,人事評価４〜７月,人事評価８〜１１月,人事評価１２〜３月,人事教育研修４〜９月,人事教育研修１０〜３月,人事労務管理４月〜３月,人事法定業務４〜６月,人事法定業務７〜９月,人事法定業務１０〜１２月,人事法定業務１〜３月")
te11 = Template.new(:id => 11,:te_name => "助成金", :te_work_names => "IT補助金４〜２月")
te12 = Template.new(:id => 12,:te_name => "ITシステム", :te_work_names => "IT導入", :is_date_fixed => 1)
te13 = Template.new(:id => 13,:te_name => "労務業務", :te_work_names => "労務業務１〜３月,労務業務４〜６月,労務業務７〜９月,労務業務１０〜１２月")
te14 = Template.new(:id => 14,:te_name => "不動産", :te_work_names => "中古マンション購入,マンション購入", :is_date_fixed => 1)
te15 = Template.new(:id => 15,:te_name => "経理業務", :te_work_names => "経理業務１〜２月,経理業務３〜４月,経理業務５〜６月,経理業務７〜８月,経理業務９〜１０月,経理業務１１〜１２月")

new_te_1 = Template.new(:id => 41, :te_name => "学習ノウハウ", :te_work_names => "１ヶ月でサービスをリリースする勉強法,２ヶ月でサービスをリリースする勉強法,３ヶ月でサービスをリリースする勉強法,１ヶ月でゲームを作って友達にドヤるための勉強法,圧倒的成長！１ヶ月のスキマ時間で資格を取る勉強法,時間がないを言い訳にしない！成功するダイエット３０日,学生のうちに将来の備えを！資格を取るまでの３ヶ月スケジュール,これで夢のトリリンガル？第２外国語を習得する１年スケジュール")
new_te_2 = Template.new(:id => 42, :te_name => "家ノウハウ", :te_work_names => "10年間で350万円節約！？家族４人１ヶ月食費４万円家庭の節約術,もう迷わない！断捨離・鬼の１週間スケジュール,徹底的コストカット！節約術30本ノック１ヶ月スケジュール,将来のために。家のお財布を見直す１週間,無料を使いこなそう！最新アプリを使って節約しまくる１ヶ月,家のごちゃごちゃで悩まない！収納整理の１ヶ月,外食がタダ！？飲食店財テクを使いこなす１ヶ月,家の時間を有意義に！最新アプリを使って稼ぐ１ヶ月,ちゃんとチェックできてる？家事の棚卸しをする１ヶ月,ここからが長い。相続が終わるまでの２年スケジュール")
new_te_3 = Template.new(:id => 43, :te_name => "買い物ノウハウ", :te_work_names => "最速！１年でマイホームを買うスケジュール,のんびりでいいかなぁ？２年でマイホームを買うスケジュール,もうやらかさない！引越し前１ヶ月マニュアル,思い立ったら即行動！１週間旅準備マニュアル,実は狙いどころ？中古物件購入するの１ヶ月,一生の買い物を最高のものに！新居インテリア選び半年スケジュール")
new_te_4 = Template.new(:id => 44, :te_name => "ビジネスノウハウ", :te_work_names => "実は簡単？アメリカで法人設立するまでの３ヶ月,ついつい忘れがち税務。スタートアップ経営者向け税務スケジュール１年分,重大な機会損失！東京都企業の助成金１年スケジュール,会社の次の１ページを！最高のオフィスを移転する３ヶ月スケジュール,新規顧客との接点を増やそう！成功する展示会出展１年スケジュール,新しいサービスを作ろう！ウェブサイト外注をする２ヶ月スケジュール")

te100 = Template.new(:id => 100,:te_name => "不明", :te_work_names => "")

te1.save; te2.save; te3.save; te4.save; te5.save;
te6.save; te7.save; te8.save; te9.save; te10.save;
te11.save; te12.save; te13.save; te14.save; te15.save; te100.save;

new_te_1.save; new_te_2.save; new_te_3.save; new_te_4.save;

k1 = Knowhow.new(:k_name => 'マイホーム購入', :k_tasks_json_url => "schedule/lifeevent/house/myhome.json", :template_id => 1, :date_duration => 330);
k2 = Knowhow.new(:k_name => '新居インテリア', :k_tasks_json_url => "schedule/lifeevent/house/interior.json", :template_id => 1, :date_duration => 395);
k3 = Knowhow.new(:k_name => '引越し', :k_tasks_json_url => "schedule/lifeevent/house/house_moving.json", :template_id => 1, :date_duration => 37);
k4 = Knowhow.new(:k_name => '結婚', :k_tasks_json_url => "schedule/lifeevent/wedding/wedding.json", :template_id => 2, :date_duration => 210);
k5 = Knowhow.new(:k_name => '離婚', :k_tasks_json_url => "schedule/lifeevent/wedding/divorce.json", :template_id => 2, :date_duration => 210);
k6 = Knowhow.new(:k_name => '赤ちゃん予防接種', :k_tasks_json_url => "schedule/lifeevent/baby/vaccination.json", :template_id => 3, :date_duration => 395);
k7 = Knowhow.new(:k_name => '子供イベント運営', :k_tasks_json_url => "schedule/work/company/event_operation.json", :template_id => 3, :date_duration => 60);
k8 = Knowhow.new(:k_name => '幼稚園バザー運営', :k_tasks_json_url => "schedule/lifeevent/baby/bazaar.json", :template_id => 3, :date_duration => 240);
k9 = Knowhow.new(:k_name => 'アメリカ大学院留学１〜９月', :k_tasks_json_url => "schedule/lifeevent/school/study_graduateschool_america.json", :template_id => 4, :start_date => '2021-01-01', :date_duration => 640, :is_date_fixed => 0);
k10 = Knowhow.new(:k_name => 'イギリス大学院留学１〜９月', :k_tasks_json_url => "schedule/lifeevent/school/study_graduateschool_england.json", :template_id => 4, :start_date => '2021-01-01', :date_duration => 640, :is_date_fixed => 0);
k11 = Knowhow.new(:k_name => '飲食店開業', :k_tasks_json_url => "schedule/work/entrepreneur/open_restaurant.json", :template_id => 5, :date_duration => 360);
k12 = Knowhow.new(:k_name => 'サロン開業', :k_tasks_json_url => "schedule/work/entrepreneur/open_salon.json", :template_id => 5, :date_duration => 180);
k13 = Knowhow.new(:k_name => 'デイサービス開業', :k_tasks_json_url => "schedule/work/entrepreneur/daycare.json", :template_id => 5, :date_duration => 210);
k14 = Knowhow.new(:k_name => '医院開業', :k_tasks_json_url => "schedule/work/entrepreneur/open_doctor.json", :template_id => 5, :date_duration => 400);
k15 = Knowhow.new(:k_name => '飲み会', :k_tasks_json_url => "schedule/work/company/nomikai.json", :template_id => 6, :date_duration => 80);
k16 = Knowhow.new(:k_name => '合宿', :k_tasks_json_url => "schedule/lifeevent/school/gassuku.json", :template_id => 6, :date_duration => 80);
k17 = Knowhow.new(:k_name => '論文', :k_tasks_json_url => "schedule/lifeevent/school/article.json", :template_id => 6, :date_duration => 420);
k18 = Knowhow.new(:k_name => '就活', :k_tasks_json_url => "schedule/work/job_hunting/recruit.json", :template_id => 6, :start_date => '2020-04-01', :date_duration => 540, :is_date_fixed => 0);
k19 = Knowhow.new(:k_name => '相続', :k_tasks_json_url => "schedule/lifeevent/disease/inheritance.json", :template_id => 7, :date_duration => 790);
k20 = Knowhow.new(:k_name => '法人米国進出', :k_tasks_json_url => "schedule/work/office/foreign/us.json", :template_id => 8, :date_duration => 120);
k21 = Knowhow.new(:k_name => '法人ドイツ進出', :k_tasks_json_url => "schedule/work/office/foreign/german.json", :template_id => 8, :date_duration => 70);
k22 = Knowhow.new(:k_name => '法人中国進出', :k_tasks_json_url => "schedule/work/office/foreign/china.json", :template_id => 8, :date_duration => 120);
k23 = Knowhow.new(:k_name => '法人タイ進出', :k_tasks_json_url => "schedule/work/office/foreign/thai.json", :template_id => 8, :date_duration => 90);
k24 = Knowhow.new(:k_name => '法人フィリピン進出', :k_tasks_json_url => "schedule/work/office/foreign/philippine.json", :template_id => 8, :date_duration => 70);
k25 = Knowhow.new(:k_name => 'オフィス移転', :k_tasks_json_url => "schedule/work/office/new_office.json", :template_id => 9, :date_duration => 210);
k26 = Knowhow.new(:k_name => 'イベント運営', :k_tasks_json_url => "schedule/work/company/event_operation.json", :template_id => 9, :date_duration => 150);
k27 = Knowhow.new(:k_name => '海外展示会', :k_tasks_json_url => "schedule/work/company/foreign_exhibition.json", :template_id => 9, :date_duration => 375);
k28 = Knowhow.new(:k_name => '会社就活準備６〜４月', :k_tasks_json_url => "schedule/work/job_hunting/company_recruit.json", :template_id => 10, :start_date => '2020-06-01', :date_duration => 690, :is_date_fixed => 0);
k29 = Knowhow.new(:k_name => '会社高卒採用準備１〜３月', :k_tasks_json_url => "schedule/work/job_hunting/kosotsu_recruit.json", :template_id => 10, :start_date => '2021-01-03', :date_duration => 455, :is_date_fixed => 0);
k30 = Knowhow.new(:k_name => '人事評価４〜７月', :k_tasks_json_url => "schedule/work/company/workflow/hr/hr_evaluation_1third.json", :template_id => 10, :start_date => '2020-04-01', :date_duration => 120, :is_date_fixed => 0);
k31 = Knowhow.new(:k_name => '人事評価８〜１１月', :k_tasks_json_url => "schedule/work/company/workflow/hr/hr_evaluation_2third.json", :template_id => 10, :start_date => '2020-08-01', :date_duration => 120, :is_date_fixed => 0);
k32 = Knowhow.new(:k_name => '人事評価１２〜３月', :k_tasks_json_url => "schedule/work/company/workflow/hr/hr_evaluation_3third.json", :template_id => 10, :start_date => '2020-12-01', :date_duration => 120, :is_date_fixed => 0);
k33 = Knowhow.new(:k_name => '人事教育研修４〜９月', :k_tasks_json_url => "schedule/work/company/workflow/hr/hr_education_1half.json", :template_id => 10, :start_date => '2020-04-01', :date_duration => 180, :is_date_fixed => 0);
k34 = Knowhow.new(:k_name => '人事教育研修１０〜３月', :k_tasks_json_url => "schedule/work/company/workflow/hr/hr_education_2half.json", :template_id => 10, :start_date => '2020-10-01', :date_duration => 180, :is_date_fixed => 0);
k35 = Knowhow.new(:k_name => '人事労務管理４月〜３月', :k_tasks_json_url => "schedule/work/company/workflow/hr/hr_work_management.json", :template_id => 10, :start_date => '2020-04-01', :date_duration => 365, :is_date_fixed => 0);
k36 = Knowhow.new(:k_name => '人事法定業務４〜６月', :k_tasks_json_url => "schedule/work/company/workflow/hr/hr_work_law_1quater.json", :template_id => 10, :start_date => '2020-04-01', :date_duration => 90, :is_date_fixed => 0);
k37 = Knowhow.new(:k_name => '人事法定業務７〜９月', :k_tasks_json_url => "schedule/work/company/workflow/hr/hr_work_law_2quater.json", :template_id => 10, :start_date => '2020-07-01', :date_duration => 90, :is_date_fixed => 0);
k38 = Knowhow.new(:k_name => '人事法定業務１０〜１２月', :k_tasks_json_url => "schedule/work/company/workflow/hr/hr_work_law_3quater.json", :template_id => 10, :start_date => '2020-10-01', :date_duration => 90, :is_date_fixed => 0);
k39 = Knowhow.new(:k_name => '人事法定業務１〜３月', :k_tasks_json_url => "schedule/work/company/workflow/hr/hr_work_law_4quater.json", :template_id => 10, :start_date => '2020-01-01', :date_duration => 90, :is_date_fixed => 0);
k40 = Knowhow.new(:k_name => 'IT補助金４〜２月', :k_tasks_json_url => "schedule/work/entrepreneur/subsidy.json", :template_id => 11, :start_date => '2020-04-01', :date_duration => 300, :is_date_fixed => 0);
k41 = Knowhow.new(:k_name => 'IT導入', :k_tasks_json_url => "schedule/work/company/application_it.json", :template_id => 12, :date_duration => 210);
k42 = Knowhow.new(:k_name => '労務業務１〜３月', :k_tasks_json_url => "schedule/work/company/workflow/labor/labor_quater1.json", :template_id => 13, :start_date => '2021-01-01', :date_duration => 90, :is_date_fixed => 0);
k43 = Knowhow.new(:k_name => '労務業務４〜６月', :k_tasks_json_url => "schedule/work/company/workflow/labor/labor_quater2.json", :template_id => 13, :start_date => '2020-04-01', :date_duration => 90, :is_date_fixed => 0);
k44 = Knowhow.new(:k_name => '労務業務７〜９月', :k_tasks_json_url => "schedule/work/company/workflow/labor/labor_quater3.json", :template_id => 13, :start_date => '2020-07-01', :date_duration => 90, :is_date_fixed => 0);
k45 = Knowhow.new(:k_name => '労務業務１０〜１２月', :k_tasks_json_url => "schedule/work/company/workflow/labor/labor_quater4.json", :template_id => 13, :start_date => '2020-10-01', :date_duration => 90, :is_date_fixed => 0);
k46 = Knowhow.new(:k_name => '中古マンション購入', :k_tasks_json_url => "schedule/lifeevent/house/old_mansion.json", :template_id => 14, :date_duration => 120);
k47 = Knowhow.new(:k_name => 'マンション修繕工事', :k_tasks_json_url => "schedule/work/real_estate/mansion_repair.json", :template_id => 14, :date_duration => 0);
k48 = Knowhow.new(:k_name => '経理業務１〜２月', :k_tasks_json_url => "schedule/work/company/workflow/accounting/accounting_1_2.json", :template_id => 15, :start_date => '2021-01-01', :date_duration => 59, :is_date_fixed => 0);
k49 = Knowhow.new(:k_name => '経理業務３〜４月', :k_tasks_json_url => "schedule/work/company/workflow/accounting/accounting_3_4.json", :template_id => 15, :start_date => '2020-03-01', :date_duration => 61, :is_date_fixed => 0);
k50 = Knowhow.new(:k_name => '経理業務５〜６月', :k_tasks_json_url => "schedule/work/company/workflow/accounting/accounting_5_6.json", :template_id => 15, :start_date => '2020-05-01', :date_duration => 61, :is_date_fixed => 0);
k51 = Knowhow.new(:k_name => '経理業務７〜８月', :k_tasks_json_url => "schedule/work/company/workflow/accounting/accounting_7_8.json", :template_id => 15, :start_date => '2020-07-01', :date_duration => 62, :is_date_fixed => 0);
k52 = Knowhow.new(:k_name => '経理業務９〜１０月', :k_tasks_json_url => "schedule/work/company/workflow/accounting/accounting_9_10.json", :template_id => 15, :start_date => '2020-09-01', :date_duration => 61, :is_date_fixed => 0);
k53 = Knowhow.new(:k_name => '経理業務１１〜１２月', :k_tasks_json_url => "schedule/work/company/workflow/accounting/accounting_11_12.json", :template_id => 15, :start_date => '2020-11-01', :date_duration => 61, :is_date_fixed => 0);
k54 = Knowhow.new(:k_name => '１ヶ月でサービスをリリースする勉強法', :k_tasks_json_url => "", :template_id => 41, :date_duration => 0);
k55 = Knowhow.new(:k_name => '２ヶ月でサービスをリリースする勉強法', :k_tasks_json_url => "", :template_id => 41, :date_duration => 0);
k56 = Knowhow.new(:k_name => '３ヶ月でサービスをリリースする勉強法', :k_tasks_json_url => "", :template_id => 41, :date_duration => 0);
k57 = Knowhow.new(:k_name => '１ヶ月でゲームを作って友達にドヤるための勉強法', :k_tasks_json_url => "", :template_id => 41, :date_duration => 0);
k58 = Knowhow.new(:k_name => '圧倒的成長！１ヶ月のスキマ時間で資格を取る勉強法', :k_tasks_json_url => "", :template_id => 41, :date_duration => 0);
k59 = Knowhow.new(:k_name => '時間がないを言い訳にしない！成功するダイエット３０日', :k_tasks_json_url => "", :template_id => 41, :date_duration => 0);
k60 = Knowhow.new(:k_name => '学生のうちに将来の備えを！資格を取るまでの３ヶ月スケジュール', :k_tasks_json_url => "", :template_id => 41, :date_duration => 0);
k61 = Knowhow.new(:k_name => 'これで夢のトリリンガル？第２外国語を習得する１年スケジュール', :k_tasks_json_url => "", :template_id => 41, :date_duration => 0);
k62 = Knowhow.new(:k_name => '10年間で350万円節約！？家族４人１ヶ月食費４万円家庭の節約術', :k_tasks_json_url => "", :template_id => 42, :date_duration => 0);
k63 = Knowhow.new(:k_name => 'もう迷わない！断捨離・鬼の１週間スケジュール', :k_tasks_json_url => "", :template_id => 42, :date_duration => 0);
k64 = Knowhow.new(:k_name => '徹底的コストカット！節約術30本ノック１ヶ月スケジュール', :k_tasks_json_url => "", :template_id => 42, :date_duration => 0);
k65 = Knowhow.new(:k_name => '将来のために。家のお財布を見直す１週間', :k_tasks_json_url => "", :template_id => 42, :date_duration => 0);
k66 = Knowhow.new(:k_name => '無料を使いこなそう！最新アプリを使って節約しまくる１ヶ月', :k_tasks_json_url => "", :template_id => 42, :date_duration => 0);
k67 = Knowhow.new(:k_name => '家のごちゃごちゃで悩まない！収納整理の１ヶ月', :k_tasks_json_url => "", :template_id => 42, :date_duration => 0);
k68 = Knowhow.new(:k_name => '外食がタダ！？飲食店財テクを使いこなす１ヶ月', :k_tasks_json_url => "", :template_id => 42, :date_duration => 0);
k69 = Knowhow.new(:k_name => '家の時間を有意義に！最新アプリを使って稼ぐ１ヶ月', :k_tasks_json_url => "", :template_id => 42, :date_duration => 0);
k70 = Knowhow.new(:k_name => 'ちゃんとチェックできてる？家事の棚卸しをする１ヶ月', :k_tasks_json_url => "", :template_id => 42, :date_duration => 0);
k71 = Knowhow.new(:k_name => 'ここからが長い。相続が終わるまでの２年スケジュール', :k_tasks_json_url => "", :template_id => 42, :date_duration => 0);
k72 = Knowhow.new(:k_name => '最速！１年でマイホームを買うスケジュール', :k_tasks_json_url => "", :template_id => 43, :date_duration => 0);
k73 = Knowhow.new(:k_name => 'のんびりでいいかなぁ？２年でマイホームを買うスケジュール', :k_tasks_json_url => "", :template_id => 43, :date_duration => 0);
k74 = Knowhow.new(:k_name => 'もうやらかさない！引越し前１ヶ月マニュアル', :k_tasks_json_url => "", :template_id => 43, :date_duration => 0);
k75 = Knowhow.new(:k_name => '思い立ったら即行動！１週間旅準備マニュアル', :k_tasks_json_url => "", :template_id => 43, :date_duration => 0);
k76 = Knowhow.new(:k_name => '実は狙いどころ？中古物件購入するの１ヶ月', :k_tasks_json_url => "", :template_id => 43, :date_duration => 0);
k77 = Knowhow.new(:k_name => '一生の買い物を最高のものに！新居インテリア選び半年スケジュール', :k_tasks_json_url => "", :template_id => 43, :date_duration => 0);
k78 = Knowhow.new(:k_name => '実は簡単？アメリカで法人設立するまでの３ヶ月', :k_tasks_json_url => "", :template_id => 44, :date_duration => 0);
k79 = Knowhow.new(:k_name => 'ついつい忘れがち税務。スタートアップ経営者向け税務スケジュール１年分', :k_tasks_json_url => "", :template_id => 44, :date_duration => 0);
k80 = Knowhow.new(:k_name => '重大な機会損失！東京都企業の助成金１年スケジュール', :k_tasks_json_url => "", :template_id => 44, :date_duration => 0);
k81 = Knowhow.new(:k_name => '会社の次の１ページを！最高のオフィスを移転する３ヶ月スケジュール', :k_tasks_json_url => "", :template_id => 44, :date_duration => 0);
k82 = Knowhow.new(:k_name => '新規顧客との接点を増やそう！成功する展示会出展１年スケジュール', :k_tasks_json_url => "", :template_id => 44, :date_duration => 0);
k83 = Knowhow.new(:k_name => '新しいサービスを作ろう！ウェブサイト外注をする２ヶ月スケジュール', :k_tasks_json_url => "", :template_id => 44, :date_duration => 0);

k1000 = Knowhow.new(:k_name => '不明', :k_tasks_json_url => "schedule/general/sample.json", :template_id => 100, :date_duration => 120);

k1.save;k2.save;k3.save;k4.save;k5.save;k6.save;k7.save;k8.save;k9.save;k10.save;
k11.save;k12.save;k13.save;k14.save;k15.save;k16.save;k17.save;k18.save;k19.save;k20.save;
k21.save;k22.save;k23.save;k24.save;k25.save;k26.save;k27.save;k28.save;k29.save;k30.save;
k31.save;k32.save;k33.save;k34.save;k35.save;k36.save;k37.save;k38.save;k39.save;k40.save;
k41.save;k42.save;k43.save;k44.save;k45.save;k46.save;k47.save;k48.save;k49.save;k50.save;
k51.save;k52.save;k53.save;k54.save;k55.save;k56.save;k57.save;k58.save;k59.save;k60.save;
k61.save;k62.save;k63.save;k64.save;k65.save;k66.save;k67.save;k68.save;k69.save;k70.save;
k71.save;k72.save;k73.save;k74.save;k75.save;k76.save;k77.save;k78.save;k79.save;k80.save;
k81.save;k82.save;k83.save;

k1000.save!

role1 = Role.new(:workurl => "e4376c18a4f27ef0bd5f", :email => "coffeecup_japan@icloud.com", :password => "kz48", :line_id => "igymb0218", :is_line_friend => true)
role1.save

w1 = Work.new(:w_name => "合宿1", :content => "", :w_percent => 0, :w_url => "e4376c18a4f27ef0bd5f", :email => "coffeecup_japan@icloud.com", :template_id => 6, :role_id => 1)
w1.save;

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


