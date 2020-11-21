require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative '../lib/scraper.rb'
require_relative '../lib/info.rb'

class CLI

    def call_to_action
        puts "Welcome to ACC! Would you like to see our staff? Enter 'yes' or 'no'."
        input = gets.chomp
        if input == "yes"
            Info.list_staff
            puts ""
            make_selection
        elsif input == "no"
            "It was a pleasure to meet you!"
        else call_to_action
        end 
    end

    def make_selection
        puts "Choose a name and enter the number to see position."
        input = gets.chomp.to_i
        puts "You have picked the #{Info.positions[input]}"
        sleep(3)
        puts "Would you like to see another? 'yes' or 'no'.."
        input2 = gets.chomp 
        if input2 == "yes"
            call_to_action
        elsif input2 == "no" 
            "Thanks for checking in. BYE!"
        else invalid_input
        end
    end

    def invalid_input
        puts "Invalid Input. Would you like to see more staff? 'yes' - 'no'"
        input = gets.chomp
        if input == "yes"
            call_to_action
        else "BYE"
        end
    end
end
