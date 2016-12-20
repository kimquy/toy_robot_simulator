[![Build Status](https://travis-ci.org/kimquy/toy_robot_simulator.svg?branch=master)](https://travis-ci.org/kimquy/toy_robot_simulator)

## Toy Robot Simulator

**Long Nguyen** - long.polyglot@gmail.com

This is a simple solution for Toy Robot Simulator problem.
The robot will need 2 inputs: board, and instruction.
Board is like the world that the robot can move within. And
instruction will be the list of moves that tell the robot what to do.

#### How it work

```ruby
# Example

board = Board.new(10,10)
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
