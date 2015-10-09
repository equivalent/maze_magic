[![Build Status](https://travis-ci.org/equivalent/maze_magic.svg)](https://travis-ci.org/equivalent/maze_magic)
[![Code Climate](https://codeclimate.com/github/equivalent/maze_magic/badges/gpa.svg)](https://codeclimate.com/github/equivalent/maze_magic)
[![Test Coverage](https://codeclimate.com/github/equivalent/maze_magic/badges/coverage.svg)](https://codeclimate.com/github/equivalent/maze_magic/coverage)

# MazeMagic

Ruby Maze generating gem.

```
 _______________________________________________________________________________________________________________________ 
| | |  _________     _____  |___  |  _  |    _____  |  ___  |___   ___  |  _  |  ___  |   |___   _|    ___________  |   |
| | | |  _  |   |_| |_    |___  |  _|  _| | |  ___| | |   |_  |  _| |  _| |_  |_  | | | |___  |_____|  _  |  _  | | |_| |
| |_____|_  | |_  |   |_|___  | |_|   |  _| |  _____|  _| |_____| |  _| |   |  ___|_____|  ___|  _  | | |___| | | |_  | |
|_______  |_| |  _| | |  _  | | |  _|_| |  _|_  |___  |   |  _  | | |   | | |_|  ___  | |___  | | | |___  |   | | |  _| |
|_  |  ___|  _| |___| | | | | | | |  ___| |  _|___  | | |_|_  | | | | |___|_   _____| |  _____| | |_  | | |_| | | |___  |
|   | |  _  |_________| |___  | |  _____| |   |  ___| |_______| | | |___|   |_  |  ___|_  |  _  | |  _|_______| |    _| |
| | | |_  |_  | |    _|  _  |_| |___|  ___| | | |  ___|_  |  ___| |_______|_  |_| | |  ___|___| |  _|  _________| |_____|
| | |_  |___| |___| |  ___|_  |_______|  _| |___|___   ___| |   |   |  _______|  _| |_  |  _____|_  | | |    ___| | |   |
| |___| |   | |  ___| | |  _______|  _  |  _|   |   |_|  ___| | | | |_  |_    |_  |  _| |_  | |   |___|  _| |  ___|___| |
|_________|___|_________|_____________|_______|___|_____|_____|___|_________|_____|_________|___|_________|_____________|
```

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
def generate_maze(height: 5, width: 5)
  MazeMagic::Generate
    .new(height: height, width: width)
    .tap { |g| g.generate_maze }
    .maze
end

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

#### Usage in web-app

You can check https://github.com/equivalent/a-maze-ing for example Rails
application, but the point is that you will represent the "Maze Wall Representation
Objects" as walls/passages. (e.g. `<div class="horizontal-wall"></div>`, ...;
or `<img src="/public/horizontal-wall.png">`)

stupid example:

```ruby
@maze = generate_maze(height: 5, width: 5)
```

```erb
<div id="maze">
  <% @maze.each_with_index do |row, index| %>
    <div class="maze-row maze-row-<%= index %>">
      <% row.each do |maze_rep| %>
        <% if maze_rep.is_a? MazeMagic::HorizontalWall  %>
           <img src="/public/horizontal-wall.png">
        <% elsif maze_rep.is_a? MazeMagic::Passage %>
           <img src="/public/passage.png">
           # ...
        <% end %>
      <% end %>
    </div>
    <div class=clear-fix></div>
  <% end %>
</div>
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
