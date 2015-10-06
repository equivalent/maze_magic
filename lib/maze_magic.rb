require 'forwardable'
require 'singleton'
require 'maze_magic/version'
require 'maze_magic/grid'
require 'maze_magic/maze_generator'
require 'maze_magic/maze_generator/randomnes'

%w(north south east west).each do |file|
  require "maze_magic/maze_generator/#{file}"
end

%w(horizontal_wall vertical_wall passage edge).each do |file|
  require "maze_magic/#{file}"
end

require 'maze_magic/maze_generator/recursive_backtracking'
require 'maze_magic/maze_generator/instructions_grid_to_cells_grid'

require 'maze_magic/renderer/console_renderer'

module MazeMagic
end
