
class CLI

    def initialize
        Scraper.new.get_page
        call_to_action
    end

    def call_to_action
        puts ""
        puts "Welcome to ACC! Would you like to see our staff? Enter 'yes' or 'no'."
        input = gets.chomp.downcase

        if input == "yes"
            make_selection
        elsif input == "no"
            say_goodbye
        else 
            puts ""
            puts " -#{input}-  Invalid, please enter 'yes' or 'no'"
            sleep(3)
            call_to_action
        end 
    end

    def make_selection
        puts ""
        Info.list_staff.each.with_index(1) {|name, index| puts "#{index} - #{name.name}"}
        puts ""
        puts "Choose a name and enter the number to see position."
        
        valid?  
    end

    def valid?
        input = gets.chomp
        if input.to_i <= 0 || input.to_i > Info.all.length
            invalid_input
        else 
            input = input.to_i - 1
           selection(input)
        end
    end

    def selection(input)
        staff_member = Info.all[input]
        puts ""
        puts " You have picked #{staff_member.name}"
        puts " Position: #{staff_member.position}"
        sleep(3)
        go_again
    end

    def go_again
        puts ""
        puts "Go again? 'yes' or 'no'.."
        input = gets.chomp.downcase

        if input == "yes"
            make_selection
        elsif input == "no" 
            say_goodbye
        else 
            invalid_input
        end
    end

    def invalid_input
        puts ""
        puts "INVALID INPUT."
        sleep(3)
        go_again
    end

    def say_goodbye
        puts ""
        puts "Thanks for checking in. It was a pleasure to meet you!"
    end
end


