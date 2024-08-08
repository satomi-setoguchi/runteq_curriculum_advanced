namespace :report_summary do
  desc 'report_summaryを送信'
  task send_report_summary: :environment do 
    ArticleMailer.report_summary.deliver_now
  end
end
