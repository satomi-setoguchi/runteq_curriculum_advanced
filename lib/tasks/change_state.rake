namespace :change_state do
  desc 'ステータスの変更'
  task change_to_published: :environment do
    Article.publish_wait.where("published_at < ?", DateTime.current).each do |article|
      article.published!
    end
  end
end
