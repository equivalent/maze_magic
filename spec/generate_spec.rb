require 'spec_helper'

RSpec.describe MazeMagic::Generate do
  include MazeExamples

  subject { described_class.new(args) }

  context 'generating maze with regular arguments' do
    let(:args) { { height: 1, width: 1 } }

    before do
      subject.generate_maze
    end

    it 'should generate array of maze objects' do
      expect(subject.maze).to eq cells_grid_1by1
    end
  end

  context 'generate maze when passing additional grid options' do
    let(:grid_args) { { height: 1, width: 1, start_x: 1, start_y: 1 } }
    let(:args) { grid_args.merge({ something_not: 'important' }) }
    let(:grid_klass_spy) { spy }

    before do
      expect(subject)
        .to receive(:grid_klass)
        .and_return(grid_klass_spy)

      subject.generate_maze
    end

    it 'should pass grid options to grid' do
      expect(grid_klass_spy)
        .to have_received(:new)
        .with(grid_args)
    end
  end
end
