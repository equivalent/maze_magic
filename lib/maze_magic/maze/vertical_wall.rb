module MazeMagic
  module Maze
    class VerticalWall
      include Singleton

      def to_console_print
        '|'
      end
    end
  end
end
