require 'spec_helper'

module MazeMagic
  class Generate
    attr_reader :height, :width, :maze
    attr_writer :algorithm

    def initialize(height:, width:)
      @height = height
      @width  = width
    end

    def generate_maze
      initialize_instructions_grid
      apply_maze_algorithm_to_grid
      generate_maze_cells_from_instructions
      return maze
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
      @instructions_grid = MazeMagic::Grid.new(height: height, width: width)
    end

    def apply_maze_algorithm_to_grid
      MazeMagic::MazeGenerator::RecursiveBacktracking
        .new(grid: instructions_grid)
        .call
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
      @maze ||= MazeMagic::MazeGenerator::InstructionsGridToCellsGrid
        .new(grid: instructions_grid)
        .tap { |generator| generator.call }
        .cells_grid
    end
  end
end

RSpec.describe MazeMagic::Generate do
  include MazeExamples

  subject { described_class.new(height: 1, width: 1) }

  before do
    subject.generate_maze
  end

  it 'should generate array of maze objects' do
    expect(subject.maze).to eq cells_grid_1by1
  end
end
