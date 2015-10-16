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
      extend Forwardable
      include Randomnes

      attr_reader :grid, :maze

      def_delegators :grid, :width, :height

      def initialize(grid:)
        @grid = grid
      end

      def generate
        preseeder.call
        carve_instructions_to_grid(grid, grid.start_x, grid.start_y)
        generate_maze
        maze
      end

      private

      def carve_instructions_to_grid(grid, current_x, current_y)
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
            carve_instructions_to_grid(grid, next_x, next_y)
          end
        end
      end

      def generate_maze
        @maze = []
        @maze << [edge] + Array.new((width * 2 - 1), hw) + [edge]

        height.times do |y|
          row = []
          row << vw

          width.times do |x|
            row << ((grid[y][x] & South.instance.to_i != 0) ? passage : hw)
            if grid[y][x] & East.instance.to_i != 0
              row << (((grid[y][x] | grid[y][x+1]) & South.instance.to_i != 0) ? passage : hw)
            else
              row << vw
            end
          end

          @maze << row
        end
      end

      def vw
        MazeMagic::VerticalWall.instance
      end

      def hw
        MazeMagic::HorizontalWall.instance
      end

      def passage
        MazeMagic::Passage.instance
      end

      def edge
        MazeMagic::Edge.instance
      end
    end
  end
end
