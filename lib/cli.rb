
require 'nokogiri'
require 'open-uri'

require_relative '../lib/scraper.rb'
require_relative '../lib/info.rb'

class CLI

    def initialize
        call_to_action
    end

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
        puts "You have picked #{Info.staff[input]} the #{Info.positions[input]}"
        sleep(2)
        puts ""
        puts "Go again? 'yes' or 'no'.."
        input2 = gets.chomp 
        if input2 == "yes"
            CLI.new
        elsif input2 == "no" 
            puts "Thanks for checking in. BYE!"
        else 
            invalid_input
        end
    end

    def invalid_input
        puts "Invalid Input. Go again? 'yes' - 'no'"
        input = gets.chomp
        if input == "yes"
            CLI.new
        else 
            puts "See ya, Thanks for your time!"
        end
    end
end

CLI.new
