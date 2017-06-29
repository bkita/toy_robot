require 'spec_helper'
require './src/robot_controller'

RSpec.describe Robot do
  let(:robot_controller) { RobotController.new }
  let(:valid_direction) { 'NORTH' }
  let(:invalid_direction) { 'NORTH_FACE' }
  let(:not_placed_error) { 'Robot is not placed on the tabletop' }

  describe 'Scenario 1' do
    it 'returns correct report' do
      robot_controller.place(0, 0, 'NORTH')
      robot_controller.move
      expect(robot_controller.report).to be == '0,1,NORTH'
    end
  end

  describe 'Scenario 2' do
    it 'returns correct report' do
      robot_controller.place(0, 0, 'NORTH')
      robot_controller.left
      expect(robot_controller.report).to be == '0,0,WEST'
    end
  end

  describe 'Scenario 3' do
    it 'returns correct report' do
      robot_controller.place(1, 2, 'EAST')
      robot_controller.move
      robot_controller.move
      robot_controller.left
      robot_controller.move
      expect(robot_controller.report).to be == '3,3,NORTH'
    end
  end

  describe 'Scenario 4' do
    it 'returns correct report' do
      robot_controller.place(5, 5, 'EAST')
      robot_controller.move
      robot_controller.move
      robot_controller.left
      robot_controller.move
      expect(robot_controller.report).to be == not_placed_error
    end
  end

  describe 'Scenario 5' do
    it 'returns correct report' do
      robot_controller.place(5, 5, 'EAST')
      robot_controller.place(5, 6, 'EAST')
      robot_controller.place(3, 3, 'SOUTH')
      robot_controller.move
      robot_controller.move
      robot_controller.move
      robot_controller.move
      robot_controller.left
      robot_controller.move
      robot_controller.move
      expect(robot_controller.report).to be == '4,0,EAST'
    end
  end

  describe 'Scenario 6' do
    it 'returns correct report' do
      robot_controller.place(2, 2, 'WEST')
      robot_controller.right
      robot_controller.right
      robot_controller.right
      robot_controller.move
      robot_controller.left
      robot_controller.left
      robot_controller.move
      expect(robot_controller.report).to be == '2,2,NORTH'
    end
  end

  describe 'Scenario 7' do
    it 'returns correct report' do
      robot_controller.place(2, 2, 'WEST')
      robot_controller.right
      robot_controller.right
      robot_controller.right
      robot_controller.move
      robot_controller.left
      robot_controller.left
      robot_controller.move
      robot_controller.place(-1, 2, 'WEST')
      expect(robot_controller.report).to be == not_placed_error
    end
  end

  describe 'Scenario 8' do
    it 'returns correct report' do
      robot_controller.place(2, 2, 'WEST')
      robot_controller.right
      robot_controller.move
      robot_controller.left
      robot_controller.place(-1, 2, 'WEST')
      robot_controller.right
      robot_controller.move
      robot_controller.left
      expect(robot_controller.report).to be == not_placed_error
    end
  end

  describe 'Scenario 9' do
    it 'returns correct report' do
      robot_controller.place(2, 2, 'WEST')
      robot_controller.right
      robot_controller.move
      robot_controller.left
      robot_controller.place(-1, 2, 'WEST')
      robot_controller.right
      robot_controller.move
      robot_controller.left
      robot_controller.place(0, 0, 'NORTH')
      expect(robot_controller.report).to be == '0,0,NORTH'
    end
  end
end
