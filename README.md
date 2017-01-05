[![Build Status](https://travis-ci.org/kimquy/toy_robot_simulator.svg?branch=master)](https://travis-ci.org/kimquy/toy_robot_simulator)

[![Code Climate](https://codeclimate.com/github/kimquy/toy_robot_simulator/badges/gpa.svg)](https://codeclimate.com/github/kimquy/toy_robot_simulator)

## Toy Robot Simulator

**Long Nguyen** - long.polyglot@gmail.com

This is a simple solution for Toy Robot Simulator problem.
The robot will need 2 inputs: board, and instruction.
Board is like the world that the robot can move within. And
instruction will be the list of moves that tell the robot what to do.

#### How it work

```ruby
# Example

board = Board.new(5, 5)
instruction = Instruction.load(file_path: "./test.txt")

Robot.perform(board: board, instruction: instruction)

```

#### Test

```ruby
# cd project_path
# run bundle install to install all needed gems
# run rspec command
rspec
```

#### Executable

The program can be run to test again some text file. For example, in the command line run the following command

```ruby
# cd into_the_project
# ruby script/app.rb test_file_path
ruby script/app.rb ./test_files/1.txt
```
