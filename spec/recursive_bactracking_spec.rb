require 'spec_helper'

RSpec.describe MazeMagic::MazeGenerator::RecursiveBacktracking do
  include MazeExamples

  let(:grid) { MazeMagic::Grid.new(height: 5, width: 5) }

  let(:generated_grid) do
     MazeMagic::MazeGenerator::InstructionsGridToCellsGrid
      .new(grid: grid)
      .tap { |generator| generator.call }
      .cells_grid
  end

  before do
    MazeMagic::MazeGenerator::RecursiveBacktracking
      .new(grid: grid)
      .tap { |alg| alg.randomizer = ->{1}  } # this will ensuere to generate predictable maze
      .call
  end

  it 'should generate Cells Grid matching 5bf5_maze'  do
    expect(generated_grid).to match_array(cells_grid)
  end
end
