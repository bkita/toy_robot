# Toy Robot Simulator

### Description:
The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5
units x 5 units. There are no other obstructions on the table surface. The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling from the table must be prevented, however further valid movement commands must still be allowed.

**Create an application that can read in commands of the following form**

```
PLACE X,Y,FACING
MOVE
LEFT
RIGHT
REPORT
```

- PLACE will put the toy robot on the table in position `X`,`Y` and facing `NORTH`, `SOUTH`, `EAST` or
`WEST`.
- The origin (0,0) can be considered to be the `SOUTH WEST` most corner.
- The first valid command to the robot is a `PLACE` command, after that, any sequence of
commands may be issued, in any order, including another `PLACE` command. The application
should discard all commands in the sequence until a valid `PLACE` command has been
executed.
- `MOVE` will move the toy robot one unit forward in the direction it is currently facing.
- `LEFT` and `RIGHT` will rotate the robot 90 degrees in the specified direction without changing
the position of the robot.
- `REPORT` will announce the `x`,`y` and `facing` of the robot. This can be in any form, but standard
output is sufficient.
- A robot that is not on the table can choose the ignore the `MOVE`, `LEFT`, `RIGHT` and `REPORT`
commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.

### Constraints:
The toy robot must not fall off the table during movement. This also includes the initial
placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

### Example Input and Output:
- **a)**
```
PLACE 0,0,NORTH
MOVE
REPORT
```
Output: `0,1,NORTH`
- **b)**
```
PLACE 0,0,NORTH
LEFT
REPORT
```
Output: `0,0,WEST`
- **c)**
```
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
```
Output: `3,3,NORTH`

### Deliverables:
The Ruby source files, the test data and any test code.
It is not required to provide any graphical output showing the movement of the toy robot.

### Things to keep in mind:
* Deliver production ready code
* Think about the problem and be ensure you are able to discuss your solution
* We are going to ask you to pair with us and make some simple changes to your robot solution
* Be wary of over-complicating things, but don't be afraid to show us your skills ;)

### Setup:

1. Make sure you have Ruby 2.4 installed in your machine. If you need help installing Ruby, take a look at the [official installation guide](https://www.ruby-lang.org/en/documentation/installation/).

2. Install the [bundler gem](http://bundler.io/) by running:

    ```gem install bundler```

3. Clone this repo:

    ```git clone git@github.com:bkita/toy_robot.git```

4. Change to the app directory:

    ```cd toy_robot```

5. Install dependencies:

    ```bundle install```

### Running the app with sample scenarios:
```ruby app.rb "scenario1.txt"```

```ruby app.rb "scenario2.txt"```

```ruby app.rb "scenario3.txt"```

### Running the app with custom scenario:
Please add a new scenario to toy_app/test_data/file_name.txt
and run the app with file name as a parameter:

```ruby app.rb "file_name.txt"```

### Running the tests:
```bundle exec rspec```

After all tests are executed, test coverage report is generated in toy_robot/coverage/index.html.
