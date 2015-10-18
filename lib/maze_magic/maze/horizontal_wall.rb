module MazeMagic
  module Maze
    class HorizontalWall
      include Singleton

      def to_console_print
        '_'
      end
    end
  end
end
