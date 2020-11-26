
require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/scraper.rb'
require_relative '../lib/info.rb'

class CLI

    def initialize
        call_to_action
    end

    def call_to_action
        puts ""
        puts "Welcome to ACC! Would you like to see our staff? Enter 'yes' or 'no'."
        input = gets.chomp

        if input == "yes"
            make_selection
        elsif input == "no"
            "It was a pleasure to meet you!"
        else 
            "Please enter 'yes' or 'no'"
            call_to_action
        end 
    end

    def make_selection
        puts ""
        Info.list_staff
        puts ""
        puts "Choose a name and enter the number to see position."
        
        valid?  
    end

    def valid?
        input = gets.chomp
        if input.chars.any? {|char| ('a'..'z').include? char.downcase} || input.to_i > 33
            invalid_input
        else
            input = input.to_i
            puts ""
            puts "You have picked #{Info.staff[input]} the #{Info.positions[input]}"
            sleep(3)
            go_again
        end
    end

    def go_again
        puts ""
        puts "Go again? 'yes' or 'no'.."
        input2 = gets.chomp 

        if input2 == "yes"
            make_selection
        elsif input2 == "no" 
            puts ""
            puts "Thanks for checking in. BYE!"
        else 
            invalid_input
        end
    end

    def invalid_input
        puts ""
        puts "INVALID INPUT."
        go_again
    end
end

CLI.new
