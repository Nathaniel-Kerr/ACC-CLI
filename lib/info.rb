
class Info

    attr_accessor :name, :position

    @@all = []

    def initialize(name, position)
        @name = name
        @position = position 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.list_staff
        self.all.select {|name| name.name }
    end
end


