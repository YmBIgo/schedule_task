if Rails.env.production?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
        :address        => 'smtp8.gmoserver.jp',
        :domain         => 'k-kazuya@coffee-cup.info',
        :port           => '587',
        :authentication => :plain,
        :user_name      => 'k-kazuya@coffee-cup.info',
        :password       => ENV['EMAIL_PASSWORD'],
        :domain         => 'coffee-cup.info',
        :enable_starttls_auto => true
    }
  elsif Rails.env.development?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
        :address        => 'smtp8.gmoserver.jp',
        :domain         => 'k-kazuya@coffee-cup.info',
        :port           => '587',
        :authentication => :plain,
        :user_name      => 'k-kazuya@coffee-cup.info',
        :password       => ENV['EMAIL_PASSWORD'],
        :domain         => 'coffee-cup.info',
        :enable_starttls_auto => true
    }
  else
    ActionMailer::Base.delivery_method = :test
  end