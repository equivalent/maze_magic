module MazeMagic
  class Generate
    attr_reader :height, :width, :maze, :options
    attr_writer :algorithm

    def initialize(height:, width:, **options)
      @height = height
      @width  = width
      @options = options
    end

    def generate_maze
      initialize_instructions_grid
      generate_maze_cells_from_instructions
      maze
    end

    def algorithm
      @algorithm ||= MazeMagic::MazeGenerator::RecursiveBacktracking
    end

    private

    attr_reader :instructions_grid

    ## Initialize instructions grid
    #
    #        _________
    #       |_|_|_|_|_|
    #       |_|_|_|_|_|
    #       |_|_|_|_|_|
    #       |_|_|_|_|_|
    #       |_|_|_|_|_|
    #
    def initialize_instructions_grid
      grid_options = options.select { |k,v| %i(start_x start_y).include?(k) }
      args = { height: height, width: width }.merge(grid_options)
      @instructions_grid = grid_klass.new(args)
    end

    ## Generate Maze Cell objects from instructions:
    #
    #  2 dimensional array of these singleton objects:
    #
    #       MazeMagic::Edge.instance              # ' '
    #       MazeMagic::HorizontalWall.instance    #  _
    #       MazeMagic::VerticalWall.instance      #  |
    #       MazeMagic::Passage.instance           # ' '
    #
    #  Objects inside can be translated to maze walls:
    #
    #        _________
    #       |_  |  _  |
    #       |  _| |  _|
    #       | |_  | | |
    #       | |  _| | |
    #       |___|_____|
    #
    def generate_maze_cells_from_instructions
      @maze ||= algorithm
        .new(grid: instructions_grid)
        .tap { |generator| generator.generate }
        .maze
    end

    def grid_klass
      MazeMagic::Grid
    end
  end
end
