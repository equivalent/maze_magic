module MazeMagic
  module MazeGenerator
    class InstructionsGridToCellsGrid
      attr_reader :instructions_grid, :cells_grid

      def initialize(grid:)
        @instructions_grid = grid
      end

      def call
        @cells_grid = []
        cells_grid << [edge] + Array.new((width * 2 - 1), hw) + [edge]

        height.times do |y|
          row = []
          row << vw

          width.times do |x|
            row << ((instructions_grid[y][x] & South.instance.to_i != 0) ? passage : hw)
            if instructions_grid[y][x] & East.instance.to_i != 0
              row << (((instructions_grid[y][x] | instructions_grid[y][x+1]) & South.instance.to_i != 0) ? passage : hw)
            else
              row << vw
            end
          end

          cells_grid << row
        end
        cells_grid
      end

      private

      def width
        instructions_grid.width
      end

      def height
        instructions_grid.height
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
