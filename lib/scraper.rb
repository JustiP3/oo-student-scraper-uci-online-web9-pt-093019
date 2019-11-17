require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))
    student_hash = {}
    profile_page.css(".social-icon-container a").each do |profile|
      link = profile.attributes["href"].value
      if link.include?("twitter")
        student_hash[:twitter] = link
      elsif link.include?("linkedin")
        student_hash[:linkedin] = link
      elsif link.include?("github")
        student_hash[:github] = link
      else
        student_hash[:blog] = link
      end
    end
    student_hash
  end

  def self.scrape_profile_page(profile_url)

  end

end
