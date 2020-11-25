require 'open-uri'
require 'nokogiri'

require_relative '../lib/info.rb'

class Scraper

    attr_accessor :site, :doc

    @@all = []
    @@staff = []
    @@positions = []

    def initialize
        get_page
    end

    def get_page
        @doc = open("https://alderwood.cc/about/").read
        @site = Nokogiri::HTML(doc)
        @site.search('.x-text-content-text-primary').each do |name|
            name = name.text
            @@all << name
            @@staff << name
        end
        @site.search('.x-text-content-text-subheadline').each do |position|
            position = position.text
            @@all << position
            @@positions << position
        end
    end

    def self.all
        @@all
    end

    def self.staff
        @@staff.delete('Latest updates on our gatherings')
        @@staff.delete('About Us')
        @@staff.delete('who we are')
        @@staff.delete('Frequently Asked Questions')
        @@staff.delete('mission:')
        @@staff.delete('The Ways:')
        @@staff.delete('our beliefs')
        @@staff.delete('Meet The Team')
        @@staff.delete('Executive Team')
        @@staff.delete('Pastors ')
        @@staff.delete('Directors')
        @@staff.delete('Associate Directors')
        @@staff.delete('admins & support staff')
        @@staff.delete('elders')
        @@staff.delete('Contact Us')
        @@staff.delete('Contact Information')
        @@staff.delete('ServIce Times And Location')
        @@staff.delete('James Rose')
        @@staff.reject(&:empty?)
        
    end

    def self.positions
        @@positions.delete('To follow Jesus every day. ')
        @@positions.delete('WORSHIP, COMMUNITY, SERVICE, & INFLUENCE.')
        @@positions.delete('What We Teach ')
        @@positions.delete('Pastor of Worship Arts')
        @@positions.delete('Compassion Center Director')
        @@positions
    end

    def self.delete_all
        @@all.clear
        @@staff.clear
        @@positions.clear
    end
end
Scraper.new
