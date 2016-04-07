require 'pry'

class Room
  attr_reader :coord, :description, :special_action, :custom_response
  def initialize(id,coord,description,special_action = false,custom_response = "")
    @id = id
    @coord = coord
    @description = description
    @special_action = special_action
    @custom_response = custom_response
  end
  def print_special_commands
    if special_action
      puts custom_response
    end
  end
end

class Player
  attr_accessor :name, :coord, :lives
  def initialize(name,coord)
    @name = name
    @coord = coord
    @lives = 6
    @direction = ""
  end
  def move(dir)
  if dir == 1
    a = 1
    puts "Choose direction:"
    print ">"
    @direction = gets.chomp.downcase

  elsif dir == 0
    a = -1
  end
  case @direction
    when "n"
      @coord[0] += a
    when "s"
      @coord[0] -= a
    when "e"
      @coord[1] += a
    when "w"
      @coord[1] -= a
    else
      puts "Sorry, I'm just a machine, I cannot do that"
      move(1)
  end
    @coord
  end
end


class Mud
  def initialize(rooms,player,origin)
    @rooms = rooms
    @player = player
    @origin = origin
  end
  def start
    @origin.description
    play
  end
  def play
    @player.move(1)
    if (@rooms.find{ |room| room.coord == @player.coord }) == nil
        @player.lives -= 1
        if @player.lives == 0
          puts "You are dead dead. Exit the game and restart again!\u2665"
        else
          puts "This is just a wall. You broke your forehead and therefore you have one less life #{@player.lives}\u2665"
          @player.move(0)
          play
        end
      else
        puts @rooms.find{ |room| room.coord == @player.coord }.description
        trigger_response
        play
    end
  end
  def trigger_response
    @rooms.each do |room|
      room.print_special_commands
    end
  end
end

room1 = Room.new(1,[0,0],"You are in a Dark Room. There is an exit on the east")
room2 = Room.new(2,[0,1],"You are in the Treasure room!! You can go back to the west and there's also a door in the north and the east")
room3 = Room.new(3,[1,1],"Nothing to see here. Just some ironhackers commiting suicide. You want to go back south? Press 's'")
room4 = Room.new(4,[0,2],"There's a bear sleeping. You can try and wake him up, or you can go west or south",true,"Well...you've been eaten by the bear")
room5 = Room.new(5,[-1,2],"Didn't the bear wake up? You're brave, get a life back")
player = Player.new("Ironhacker",[0,0])
labyrinth = [room1,room2,room3,room4,room5]
game = Mud.new(labyrinth,player,room1)

game.start













