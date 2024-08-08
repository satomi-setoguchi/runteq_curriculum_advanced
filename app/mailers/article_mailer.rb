class ArticleMailer < ApplicationMailer
  def report_summary
    @published_article_all = Article.published.count
    yesterday = Time.zone.today - 1
    from = yesterday.beginning_of_day
    to = yesterday.end_of_day
    @published_yesterday = Article.where(published_at: from..to).count
    @article_titles = Article.where(published_at: from..to).pluck(:title)
    mail(subject: '公開済記事の集計結果')
  end
end
