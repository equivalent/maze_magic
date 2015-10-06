module MazeMagic
  module MazeGenerator
    ## RecursiveBacktracking algorithm for generating Maze
    #
    #  original author Jamis Buck
    #
    #  http://weblog.jamisbuck.org/2010/12/27/maze-generation-recursive-backtracking
    #
    #  I've wraped the algorith with objects
    #
    class RecursiveBacktracking
      include Randomnes

      attr_reader :grid

      def initialize(grid: grid)
        @grid = grid
      end

      def call
        preseeder.call
        algorithm(grid, grid.start_x, grid.start_y)
        grid
      end

      private

      def algorithm(grid, current_x, current_y)
        directions = [
          North.instance,
          South.instance,
          East.instance,
          West.instance
        ]
          .sort_by{randomizer.call}

        directions.each do |direction|
          next_x, next_y = current_x + direction.direction_x, current_y + direction.direction_y

          if next_y.between?(0, grid.length-1) && next_x.between?(0, grid[next_y].length-1) && grid[next_y][next_x] == 0
            grid[current_y][current_x] |= direction.to_i
            grid[next_y][next_x] |= direction.oposite.to_i
            algorithm(grid, next_x, next_y)
          end
        end
      end
    end
  end
end
