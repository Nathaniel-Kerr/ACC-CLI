
require 'nokogiri'
require 'open-uri'

require_relative '../lib/scraper.rb'

class Info

    def self.list_staff
        Scraper.staff.select.with_index {|name, index| puts "#{index} - #{name}"}
    end

    def self.staff
        Scraper.staff
    end

    def self.positions
        Scraper.positions
    end
end
Info.new