require 'spec_helper'
require './src/robot_controller'

RSpec.describe RobotController do
  let(:robot_controller) { RobotController.new }
  let(:valid_direction) { 'NORTH' }
  let(:invalid_direction) { 'NORTH_FACE' }
  let(:place_error_message) { 'Robot is not placed on the tabletop' }

  describe '#place' do
    describe 'invalid parameters' do
      it 'should return false for x > 4' do
        robot_controller.place(5, 1, valid_direction)
        expect(robot_controller.placed?).to be false
      end

      it 'should return false for x < 0' do
        robot_controller.place(-1, 1, valid_direction)
        expect(robot_controller.placed?).to be false
      end

      it 'should return false for y > 4' do
        robot_controller.place(1, 5, valid_direction)
        expect(robot_controller.placed?).to be false
      end

      it 'should return false for y < 0' do
        robot_controller.place(1, -1, valid_direction)
        expect(robot_controller.placed?).to be false
      end

      it 'should return false for invalid direction' do
        robot_controller.place(1, 2, invalid_direction)
        expect(robot_controller.placed?).to be false
      end

      it 'should return false when robot is not placed' do
        expect(robot_controller.placed?).to be == false
      end
    end

    describe 'valid parameters' do
      it 'should return true for empty parameters' do
        robot_controller.place(0, 0, valid_direction)
        expect(robot_controller.placed?).to be true
      end
    end
  end
end
