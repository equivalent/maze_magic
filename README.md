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

#### Simple use:

```ruby
require 'maze_magic'

def generate_maze
  MazeMagic::Generate
    .new(height: 5, width: 5)
    .tap { |g| g.generate_maze }
    .maze
end

# maze is a 2 dimensional array of these singleton objects:
#
#       MazeMagic::Edge.instance              # ' '
#       MazeMagic::HorizontalWall.instance    #  _
#       MazeMagic::VerticalWall.instance      #  |
#       MazeMagic::Passage.instance           # ' '
#
# so something like:
#
#    [[Edge, HW, HW, HW, HW, Edge],[VW, P, P,VW,P,P,P, HW],...]
#
maze = generate_maze 


# optional: render in console
MazeMagic::Renderer::ConsoleRenderer.new(cells_grid: maze).call

#  _________ 
# |_  |  _  |
# |  _| |  _|
# | |_  | | |
# | |  _| | |
# |___|_____|

```

#### More Complex use:

`MazeMagic::Generate` is just an Interface. For more complex usage check
`lib/maze_magic/generate.rb`, ...or specs.

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
