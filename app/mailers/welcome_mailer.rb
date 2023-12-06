class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.reset.subject
  #
  def welcome
    mail to: params[:user].email
  end
end