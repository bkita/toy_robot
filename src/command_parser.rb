require_relative 'robot_controller'

# Class to parse and execute commands from file
class CommandParser

  attr_reader :robot_controller

  def initialize
    @robot_controller = RobotController.new
  end

  def parse(command)
    if command.start_with?('PLACE')
      command.sub! ' ', ','
      place_arr = command.split(',')

      return 'Unknown command' unless place_arr.size != 3

      x = Integer(place_arr[1]) if place_arr[1]
      y = Integer(place_arr[2]) if place_arr[2]
      direction = place_arr[3].chomp if place_arr[3]

      @robot_controller.place(x, y, direction)
    elsif command.start_with?('MOVE')
      @robot_controller.move
    elsif command.start_with?('LEFT')
      @robot_controller.left
    elsif command.start_with?('RIGHT')
      @robot_controller.right
    elsif command.start_with?('REPORT')
      print @robot_controller.report
    else
      print 'Unknown command'
    end
  end
end
