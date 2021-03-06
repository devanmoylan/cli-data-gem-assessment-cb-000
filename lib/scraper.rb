require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open("http://www.scout.com/college/football/recruiting/news?type=stories&sortBy=Date&site=ScoutFootball.com"))
    @posts = []
    doc.css(".story-list-item").each_with_index do |post, index|
      @posts[index] = {
        :title => post.css(".story-deck h1 a span").last.text,
        :author => post.css(".story-deck .story-from").text,
        :time => post.css(".story-deck .time-stamp").text,
        :description => post.css(".story-deck p").text,
        :link => post.css(".story-deck .story-stuff a").attribute("href").value
      }
    end
    @posts
    binding.pry
  end

end
