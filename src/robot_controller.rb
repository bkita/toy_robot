require_relative './robot'
require_relative './table'

# Class represents robot controller
class RobotController
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  def initialize
    @table = Table.new
    @robot = Robot.new
    @placed = false
  end

  def place(x, y, facing)
    if invalid_direction(facing) || invalid_coordinates(x, y)
      @placed = false
    else
      @robot.x = x
      @robot.y = y
      @robot.direction = facing
      @placed = true
    end
  end

  def placed?
    @placed
  end

  def report
    return 'Robot is not placed on the tabletop' unless @placed

    return "#{@robot.x},#{@robot.y},#{@robot.direction}" if @placed
  end

  def move
    return 'Robot is not placed on the tabletop' unless @placed

    if @robot.direction == 'NORTH'
      @robot.y < @table.max_y ? @robot.y += 1 : @robot.y
    elsif @robot.direction == 'SOUTH'
      @robot.y > @table.min_y ? @robot.y -= 1 : @robot.y
    elsif @robot.direction == 'EAST'
      @robot.x < @table.max_x ? @robot.x += 1 : @robot.x
    elsif @robot.direction == 'WEST'
      @robot.x > @table.min_x ? @robot.x -= 1 : @robot.x
    end
  end

  def left
    return 'Robot is not placed on the tabletop' unless @placed

    if @robot.direction == DIRECTIONS.first
      @robot.direction = DIRECTIONS.last
    else
      @robot.direction = DIRECTIONS[DIRECTIONS.index(@robot.direction) - 1]
    end
  end

  def right
    return 'Robot is not placed on the tabletop' unless @placed

    if @robot.direction == DIRECTIONS.last
      @robot.direction = DIRECTIONS.first
    else
      @robot.direction = DIRECTIONS[DIRECTIONS.index(@robot.direction) + 1]
    end
  end

  private

  def valid_direction?(direction)
    DIRECTIONS.include? direction
  end

  def valid_x_coordinate?(coordinate)
    (@table.min_x..@table.max_x).cover?(coordinate)
  end

  def valid_y_coordinate?(coordinate)
    (@table.min_y..@table.max_y).cover?(coordinate)
  end

  def invalid_coordinates(x, y)
    !valid_x_coordinate?(x) || !valid_y_coordinate?(y)
  end

  def invalid_direction(direction)
    !valid_direction?(direction)
  end
end
