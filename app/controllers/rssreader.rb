class RssReader
  require 'rss'
  require 'open-uri'
  def self.posts_for(feed_url, length = 0, perform_validation=false, v_fonte = "")
    posts = []
    open(feed_url) do |rss|
      posts = RSS::Parser.parse(rss, perform_validation).items
    end
    if length > 0
      posts[0..length - 1] if posts.size > length
    else
      posts[0..length - 1]
    end
    
  end
end