require 'spec_helper'

RSpec.describe MazeMagic::Renderer::ConsoleRenderer do
  include MazeExamples

  subject { described_class.new(cells_grid: cells_grid) }

  let(:expected_body) { File.read(MazeMagic::Tests.fixtures.join('5by5_dummy_maze.txt')) }
  let(:printed_body) { "" }
  let(:printer) { ->(arg){ printed_body << arg  } }

  before do
    subject.printer = printer
    subject.call
  end

  it 'should generate readable pattern' do
    expect(printed_body).to eq expected_body
  end
end
