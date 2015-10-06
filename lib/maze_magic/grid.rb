module MazeMagic
  class Grid
    extend Forwardable

    attr_reader :height, :width, :start_x, :start_y

    def_delegators :grid_map, :size, :each, :length, :[], :to_s, :to_a

    def initialize(width:, height:, start_x: 0, start_y: 0)
      @width  = width
      @height = height
      @start_x = start_x
      @start_y = start_y
    end

    private

    def grid_map
      @grid_map ||= Array.new(height) { Array.new(width, 0) }
    end
  end
end
