class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com', to: 'admin@example.com'
  layout 'mailer'
end

