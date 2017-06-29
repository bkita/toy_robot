require 'spec_helper'
require './src/robot_controller'

RSpec.describe RobotController do
  let(:robot_controller) { RobotController.new }
  let(:valid_direction) { 'NORTH' }
  let(:invalid_direction) { 'NORTH_FACE' }

  describe '#move' do
    describe 'NORTH' do
      describe 'valid move' do
        it 'moves robot_controller by 1 NORTH' do
          robot_controller.place(0, 0, 'NORTH')
          robot_controller.move

          expect(robot_controller.report).to be == '0,1,NORTH'
        end

        it 'moves robot_controller by 1 NORTH' do
          robot_controller.place(0, 3, 'NORTH')
          robot_controller.move

          expect(robot_controller.report).to be == '0,4,NORTH'
        end
      end

      describe 'invalid move' do
        it 'does not move robot_controller by 1 NORTH' do
          robot_controller.place(0, 4, 'NORTH')
          robot_controller.move

          expect(robot_controller.report).to be == '0,4,NORTH'
        end
      end
    end

    describe 'SOUTH' do
      describe 'valid move' do
        it 'moves robot_controller by 1 SOUTH' do
          robot_controller.place(0, 2, 'SOUTH')
          robot_controller.move

          expect(robot_controller.report).to be == '0,1,SOUTH'
        end
      end

      describe 'invalid move' do
        it 'does not move robot_controller by 1 SOUTH' do
          robot_controller.place(0, 0, 'SOUTH')
          robot_controller.move

          expect(robot_controller.report).to be == '0,0,SOUTH'
        end
      end
    end

    describe 'EAST' do
      describe 'valid move' do
        it 'moves robot_controller by 1 EAST' do
          robot_controller.place(1, 1, 'EAST')
          robot_controller.move

          expect(robot_controller.report).to be == '2,1,EAST'
        end
      end

      describe 'invalid move' do
        it 'does not move robot_controller by 1 EAST' do
          robot_controller.place(4, 0, 'EAST')
          robot_controller.move

          expect(robot_controller.report).to be == '4,0,EAST'
        end
      end
    end

    describe 'WEST' do
      describe 'valid move' do
        it 'moves robot_controller by 1 WEST' do
          robot_controller.place(1, 1, 'WEST')
          robot_controller.move

          expect(robot_controller.report).to be == '0,1,WEST'
        end
      end

      describe 'invalid move' do
        it 'does not move robot_controller by 1 WEST' do
          robot_controller.place(0, 0, 'WEST')
          robot_controller.move

          expect(robot_controller.report).to be == '0,0,WEST'
        end
      end
    end
  end
end
