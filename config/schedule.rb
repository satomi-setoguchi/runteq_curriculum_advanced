# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
require File.expand_path(File.dirname(__FILE__) + '/environment')
rails_env = ENV['RAILS_ENV'] || :development
set :environment, rails_env
# Example:
#
# set :output, "/path/to/my/cron_log.log"
set :output, "#{Rails.root}/log/cron.log"
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
every 1.hour do
  rake "change_state:change_to_published"
end
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
every 1.day, at: '9:00 am' do
  rake 'article_mailer:report_summary'
end
# Learn more: http://github.com/javan/whenever
