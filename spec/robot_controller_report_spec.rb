require 'spec_helper'
require './src/robot_controller'

RSpec.describe RobotController do
  let(:robot_controller) { RobotController.new }
  let(:valid_direction) { 'NORTH' }
  let(:invalid_direction) { 'NORTH_FACE' }
  let(:place_error_message) { 'Robot is not placed on the tabletop' }

  describe '#report' do
    describe 'invalid place' do
      it 'should return error message for invalid x' do
        robot_controller.place(-1, 1, valid_direction)

        expect(robot_controller.report).to be == place_error_message
      end

      it 'should return error message for invalid x' do
        robot_controller.place(5, 1, valid_direction)

        expect(robot_controller.report).to be == place_error_message
      end

      it 'should return error message for invalid y' do
        robot_controller.place(1, -1, valid_direction)

        expect(robot_controller.report).to be == place_error_message
      end

      it 'should return error message for invalid y' do
        robot_controller.place(1, 5, valid_direction)

        expect(robot_controller.report).to be == place_error_message
      end

      it 'should return error message for invalid direction' do
        robot_controller.place(1, 1, invalid_direction)

        expect(robot_controller.report).to be == place_error_message
      end

      it 'should take robot off the table for negative coordinates' do
        robot_controller.place(1, 1, valid_direction)
        robot_controller.place(-1, 1, invalid_direction)

        expect(robot_controller.report).to be == place_error_message
      end
    end
  end

  describe 'valid place' do
    it 'should return robot coordinates for place command' do
      robot_controller.place(1, 1, valid_direction)

      expect(robot_controller.report).to be == '1,1,NORTH'
    end

    it 'should return robot coordinates when last place command is valid' do
      robot_controller.place(-1, 1, valid_direction)
      robot_controller.place(1, -1, valid_direction)
      robot_controller.place(1, 1, invalid_direction)
      robot_controller.place(1, 1, valid_direction)

      expect(robot_controller.report).to be == '1,1,NORTH'
    end
  end
end
