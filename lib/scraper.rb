
class Scraper

    attr_accessor :site, :doc

    def get_page
        headers = ['meet the team', 'executive team','pastors ', 'directors', 'associate directors', 'admins & support staff', 'elders', 'contact us', 'contact information', 'service times and location']
        p_headers = ['pastor of worship arts', 'compassion center director']
        
        @doc = open("https://alderwood.cc/about/").read
        @site = Nokogiri::HTML(doc)
    
           var1 = @site.css(".e11-50 h1.x-text-content-text-primary").collect do |name| 
                staff_name = name.children.text
                if !headers.include?(staff_name.downcase) && staff_name != '' 
                staff_name
                end
            end.compact

            staff_position = @site.css('.e11-50 span.x-text-content-text-subheadline').collect do |position|
                if !p_headers.include?(position.text.downcase)
                position.text
                end
            end.compact

        var1.each.with_index do |name, index| 
    
        Info.new(name, staff_position[index])
        end
    end

end

