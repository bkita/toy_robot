require 'spec_helper'
require './src/robot_controller'

RSpec.describe RobotController do
  let(:robot_controller) { RobotController.new }
  let(:invalid_direction) { 'NORTH_FACE' }
  let(:not_placed_error) { 'Robot is not placed on the tabletop' }

  describe '#left' do
    it 'returns an error when robot is not placed' do
      robot_controller.place(5, 0, 'WEST')
      robot_controller.left

      expect(robot_controller.report).to be == not_placed_error
    end

    it 'returns correct direction after rotating left' do
      robot_controller.place(0, 0, 'NORTH')
      robot_controller.left

      expect(robot_controller.report).to be == '0,0,WEST'
    end

    it 'returns correct direction after rotating left 3 times' do
      robot_controller.place(0, 0, 'NORTH')
      robot_controller.left
      robot_controller.left
      robot_controller.left

      expect(robot_controller.report).to be == '0,0,EAST'
    end
  end
end
