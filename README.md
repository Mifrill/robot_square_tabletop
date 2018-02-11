[![Build Status](https://travis-ci.org/Mifrill/robot_square_tabletop.svg?branch=master)](https://travis-ci.org/Mifrill/robot_square_tabletop)
[![Build status](https://ci.appveyor.com/api/projects/status/bn0sripeuppeadt7?svg=true)](https://ci.appveyor.com/project/Mifrill/robot-square-tabletop)
[![CircleCI](https://circleci.com/gh/Mifrill/robot_square_tabletop.svg?style=svg)](https://circleci.com/gh/Mifrill/robot_square_tabletop)
[ ![Codeship Status for Mifrill/robot_square_tabletop](https://app.codeship.com/projects/e0bfd6f0-6675-0135-accc-6e4d1ccb1394/status?branch=master)](https://app.codeship.com/projects/240930)
[![Maintainability](https://api.codeclimate.com/v1/badges/12dd6d601a5add71b66f/maintainability)](https://codeclimate.com/github/Mifrill/robot_square_tabletop/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/Mifrill/robot_square_tabletop/badge.svg?branch=master)](https://coveralls.io/github/Mifrill/robot_square_tabletop?branch=master)
[![Test Coverage](https://api.codeclimate.com/v1/badges/12dd6d601a5add71b66f/test_coverage)](https://codeclimate.com/github/Mifrill/robot_square_tabletop/test_coverage)
[![codecov](https://codecov.io/gh/Mifrill/robot_square_tabletop/branch/master/graph/badge.svg)](https://codecov.io/gh/Mifrill/robot_square_tabletop)
[![Inline docs](http://inch-ci.org/github/Mifrill/robot_square_tabletop.svg?branch=master)](http://inch-ci.org/github/Mifrill/robot_square_tabletop)
[![Code Triagers Badge](https://www.codetriage.com/mifrill/robot_square_tabletop/badges/users.svg)](https://www.codetriage.com/mifrill/robot_square_tabletop)
[![Dependency Status](https://dependencyci.com/github/Mifrill/robot_square_tabletop/badge)](https://dependencyci.com/github/Mifrill/robot_square_tabletop)
[![BCH compliance](https://bettercodehub.com/edge/badge/Mifrill/robot_square_tabletop?branch=master)](https://bettercodehub.com/)

# Toy Robot Simulator

## Running
```
    sudo chmod 777 bin/start
    
    #input command by hand
    bin/start 
    
      or
      
    #command list from file    
    bin/start file test.example.json
```

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
