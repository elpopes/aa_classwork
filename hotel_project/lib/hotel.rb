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
        elsif @rooms[room].add_occupant(name)  
            puts "check in successful"
          else puts "sorry, room is full"
        end
    end

    def has_vacancy?
        rooms.values.any? { |room| room.available_space > 0}
    end
    
    def list_rooms
        @rooms.each do |room, beds|
        puts "#{room}      #{beds.available_space}"
        end
    end
end
