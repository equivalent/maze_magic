[![Build Status](https://travis-ci.org/equivalent/maze_magic.svg)](https://travis-ci.org/equivalent/maze_magic)
[![Code Climate](https://codeclimate.com/github/equivalent/maze_magic/badges/gpa.svg)](https://codeclimate.com/github/equivalent/maze_magic)

# MazeMagic

Ruby Maze generating gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'maze_magic'
```

And then execute:

    $ bundle

## Usage

```ruby
# init grid
grid = MazeMagic::Grid.new(height: 5, width: 5)


#  _________ 
# |_|_|_|_|_|
# |_|_|_|_|_|
# |_|_|_|_|_|
# |_|_|_|_|_|
# |_|_|_|_|_|

# apply maze algorithm instructions to grid
MazeMagic::MazeGenerator::RecursiveBacktracking
  .new(grid: grid)
  .call

# translate maze instructions to Cells:
#
#   MazeMagic::Edge.instance              # ' '
#   MazeMagic::HorizontalWall.instance    #  _
#   MazeMagic::VerticalWall.instance      #  |
#   MazeMagic::Passage.instance           # ' '
#
cells_grid = MazeMagic::MazeGenerator::InstructionsGridToCellsGrid
  .new(grid: grid)
  .tap { |generator| generator.call }
  .cells_grid

# optional - render the cells viea console
MazeMagic::Renderer::ConsoleRenderer.new(cells_grid: cells_grid).call

#  _________ 
# |_  |  _  |
# |  _| |  _|
# | |_  | | |
# | |  _| | |
# |___|_____|

```

## Maze generating Algorithm

At this point there is just altered version of [Recursive Backtracking
algorithm](http://weblog.jamisbuck.org/2010/12/27/maze-generation-recursive-backtracking),
but the the gem can be extended by any algorithm.


## Contributing

Bug reports and pull requests are welcome. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## TODO

* add support for more Algorithms (e.g. http://www.jamisbuck.org/mazes/)
