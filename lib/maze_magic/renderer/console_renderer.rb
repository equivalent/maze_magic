module MazeMagic
  module Renderer
    class ConsoleRenderer
      attr_reader :cells_grid
      attr_writer :printer

      def initialize(cells_grid:)
        @cells_grid = cells_grid
      end

      def call
        cells_grid.each do |row|
          row.each do |cell|
            printer.call(cell.to_console_print)
          end
          printer.call("\n")
        end
        nil
      end

      def printer
        @printer ||= ->(*args){print(*args)}
      end
    end
  end
end
