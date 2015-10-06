require 'spec_helper'

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

  context 'generating grid of heigh 2 and width 3' do
    let(:attributes) { {height: 2, width: 3, start_x: 1 , start_y: 1} }

    describe "#height" do
      it { expect(subject.height).to be 2 }
    end

    describe "#width" do
      it { expect(subject.width).to be 3 }
    end

    describe '#start_y' do
      it { expect(subject.start_y).to be 1 }
    end

    describe '#start_x' do
      it { expect(subject.start_y).to be 1 }
    end

    describe '#to_a' do
      it do
        expect(subject.to_a).to match_array([
          [0, 0, 0],
          [0, 0, 0]
        ])
      end
    end
  end
end
