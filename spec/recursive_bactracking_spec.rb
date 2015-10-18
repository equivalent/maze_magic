require 'spec_helper'

RSpec.describe MazeMagic::MazeGenerator::RecursiveBacktracking do
  include MazeExamples

  let(:grid) { MazeMagic::Grid.new(height: 5, width: 5) }

  let(:maze) do
    MazeMagic::MazeGenerator::RecursiveBacktracking
      .new(grid: grid)
      .tap { |alg| alg.randomizer = ->{1}  } # this will ensuere to generate predictable maze
      .tap { |generator| generator.generate }
      .maze
  end

  it 'should generate Cells Grid matching 5bf5_maze'  do
    expect(maze).to match_array(cells_grid_5by5)
  end
end
