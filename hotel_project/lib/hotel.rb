require "byebug"
require_relative "room"

class Hotel

    def initialize(name, room_hash)
        @name = name
        @rooms = {}
        room_hash.each do |name,beds|
            @rooms[name] = Room.new(beds)
        end

    end

    def name
        # debugger
        (@name.split(" ").map {|n| n.capitalize}).join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        rooms.include?(room)
    end

    def check_in(person, room)
        if !room_exists?(room)
            puts "sorry, room does not exist"
            
    end

end
