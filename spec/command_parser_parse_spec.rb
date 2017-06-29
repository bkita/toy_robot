require 'spec_helper'
require './src/command_parser'
require './src/robot_controller'

RSpec.describe CommandParser do
  let(:command_parser) { CommandParser.new }
  let(:robot_controller) { command_parser.robot_controller }
  let(:place_error_message) { 'Robot is not placed on the tabletop' }

  describe '#parse' do
    describe 'invalid PLACE command' do
      it 'should not place robot when all parameters are missing' do
        command_parser.parse('PLACE')
        expect(robot_controller.placed?).to be == false
      end

      it 'should not place robot when one parameter is missing' do
        command_parser.parse('PLACE 0,0')
        expect(robot_controller.placed?).to be == false
      end

      it 'should not place robot for invalid place command format' do
        command_parser.parse('PLACE0,0,NORTH')
        expect(robot_controller.placed?).to be == false
      end
    end

    describe 'valid PLACE command' do
      it 'should place robot for valid place command' do
        command_parser.parse('PLACE 0,0,NORTH')
        expect(robot_controller.placed?).to be == true
      end
    end

    describe 'invalid MOVE and REPORT commands' do
      it 'should return place error message' do
        command_parser.parse('MOVE')
        expect(robot_controller.placed?).to be == false
        expect(robot_controller.report).to be == place_error_message
      end
    end

    describe 'valid MOVE and REPORT commands' do
      it 'should place robot and move robot' do
        command_parser.parse('PLACE 0,0,NORTH')
        command_parser.parse('MOVE')
        expect(robot_controller.placed?).to be == true
        expect(robot_controller.report).to be == '0,1,NORTH'
      end
    end

    describe 'invalid LEFT and REPORT commands' do
      it 'should return place error message' do
        command_parser.parse('LEFT')
        expect(robot_controller.placed?).to be == false
        expect(robot_controller.report).to be == place_error_message
      end
    end

    describe 'valid LEFT and REPORT commands' do
      it 'should place and turn left' do
        command_parser.parse('PLACE 0,0,NORTH')
        command_parser.parse('LEFT')
        expect(robot_controller.placed?).to be == true
        expect(robot_controller.report).to be == '0,0,WEST'
      end
    end

    describe 'invalid RIGHT and REPORT commands' do
      it 'should return place error message' do
        command_parser.parse('RIGHT')
        expect(robot_controller.placed?).to be == false
        expect(robot_controller.report).to be == place_error_message
      end
    end

    describe 'valid RIGHT and REPORT commands' do
      it 'should place turn right' do
        command_parser.parse('PLACE 0,0,NORTH')
        command_parser.parse('RIGHT')
        expect(robot_controller.placed?).to be == true
        expect(robot_controller.report).to be == '0,0,EAST'
      end
    end

    describe 'REPORT command' do
      it 'should return place error message' do
        expect { command_parser.parse('REPORT') }.to output(place_error_message).to_stdout
      end

      it 'should place and report correct location' do
        command_parser.parse('PLACE 0,0,NORTH')
        expect { command_parser.parse('REPORT') }.to output('0,0,NORTH').to_stdout
      end
    end

    describe 'unknown command' do
      it 'should return "Unknown command" for unknown command' do
        expect { command_parser.parse('') }.to output('Unknown command').to_stdout
      end
    end
  end
end
