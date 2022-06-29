# frozen_string_literal: true

# mailer
class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def report_email
    @post = params[:post]
    @url  = 'http://example.com/login'
    mail(to: 'saif.ali@devsinc.com', subject: 'This post is reported!')
  end

  def report_comment
    @comment = params[:comment]
    @url = 'http://example.com/login'
    mail(to: 'saif.ali@devsinc.com', subject: 'This Comment is reported!')
  end
end
