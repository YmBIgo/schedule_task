class NotificationMailer < ApplicationMailer
    default from: "k-kazuya@coffee-cup.info"

    def send_confirm_to_user(role, password, email, w_url)
      @role = role
      @password = password
      @email = email
      @w_url = w_url
      mail(
        subject: "会員登録が完了しました。", #メールのタイトル
        to: email #宛先
      ) do |format|
        format.text
      end
    end

    def send_confirm_to_admin(role, password, email, w_url)
      @role = role
      @password = password
      @email = email
      @w_url = w_url
      mail(
        subject: "会員登録が完了しました。", #メールのタイトル
        to: "coffeecup_japan@icloud.com" #宛先
      ) do |format|
        format.text
      end
    end

end
