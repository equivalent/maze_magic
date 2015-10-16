require 'forwardable'
require 'singleton'
require 'maze_magic/version'
require 'maze_magic/grid'
require 'maze_magic/maze_generator'
require 'maze_magic/maze_generator/randomnes'

%w(horizontal_wall vertical_wall passage edge).each do |file|
  require "maze_magic/#{file}"
end

require 'maze_magic/maze_generator/recursive_backtracking'

require 'maze_magic/renderer/console_renderer'
require 'maze_magic/generate'

module MazeMagic
end
