require 'open-uri'
require 'pry'

class Scraper


  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))
    collection = [] #collection of each student hash
#  {:name => "Abby Smith", :location => "Brooklyn, NY", :profile_url => "students/abby-smith.html"}
    index_page.css("div roster-cards-container").each do |card|
      link = student.attributs["href"].value
      name = student.css(".student-name").text
      location = student.css(".stuent-location").text
      student_hash = {
        :name => name,
        :location => location,
        :profile_url => link
      }
      collection << student_hash
    end

  collection
  end

  def self.scrape_profile_page(profile_url)
    index_page.css(".social-icon-container a").each do |profile|
      student_hash = {} #exists inside the iteration scope only
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
      collection << student_hash
    end

    collection
  end


end
