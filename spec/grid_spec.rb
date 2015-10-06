require 'spec_helper'

require 'forwardable'

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

RSpec.describe MazeMagic::Grid do
  subject(:grid) { described_class.new(attributes) }

  context 'generating grid of heigh 3 and width 7' do
    let(:attributes) { {height: 3, width: 7} }

    describe "#height" do
      it { expect(subject.height).to be 3 }
    end

    describe "#width" do
      it { expect(subject.width).to be 7 }
    end

    describe '#start_y' do
      it { expect(subject.start_y).to be 0 }
    end

    describe '#start_x' do
      it { expect(subject.start_y).to be 0 }
    end

    describe '#length' do
      it { expect(subject.length).to be 3 }
    end

    describe '#to_s' do
      it do
        body = '[[0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0]]'
        expect(subject.to_s).to eq body
      end
    end

    describe '#to_a' do
      it do
        expect(subject.to_a).to match_array([
          [0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0]
        ])
      end
    end

    describe '#[]' do
      it do
        expect(subject[0]).to match_array([0, 0, 0, 0, 0, 0, 0])
      end
    end

    describe '#each' do
      it do
        expect(subject.each).to be_kind_of Enumerator
      end
    end
  end
end




