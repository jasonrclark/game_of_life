require 'spec_helper'
require 'game'

describe Game do
  it 'exists' do
    expect(Game.new).to_not be_nil
  end

  describe 'Grid' do
    subject { Game::Grid.new }

    it 'is 10 by default' do
      expect(subject.size).to eq(10)
    end

    it 'lives with 2' do
      subject.enliven(0, 1)
      subject.enliven(0, 0)

      expect(subject.live?(1, 1)).to eq(true)
    end

    it 'lives with 3' do
      subject.enliven(0, 1)
      subject.enliven(0, 0)
      subject.enliven(1, 2)

      expect(subject.live?(1, 1)).to eq(true)
    end

    it 'lives with 3' do
      subject.enliven(0, 1)
      subject.enliven(0, 0)
      subject.enliven(1, 2)

      expect(subject.live?(1, 1)).to eq(true)
    end

    it 'dies with 1' do
      subject.enliven(0, 1)

      expect(subject.live?(1, 1)).to eq(false)
    end

    it 'all alone' do
      expect(subject.live?(1, 1)).to eq(false)
    end

    it 'dies with 4' do
      subject.enliven(0, 0)
      subject.enliven(0, 1)
      subject.enliven(0, 2)
      subject.enliven(1, 0)

      expect(subject.live?(1, 1)).to eq(false)
    end

    it 'dies with 5' do
      subject.enliven(0, 0)
      subject.enliven(0, 1)
      subject.enliven(0, 2)
      subject.enliven(1, 0)
      subject.enliven(1, 2)

      expect(subject.live?(1, 1)).to eq(false)
    end

    it 'dies with 6' do
      subject.enliven(0, 0)
      subject.enliven(0, 1)
      subject.enliven(0, 2)
      subject.enliven(1, 0)
      subject.enliven(1, 2)
      subject.enliven(2, 0)

      expect(subject.live?(1, 1)).to eq(false)
    end

    it 'dies with 7' do
      subject.enliven(0, 0)
      subject.enliven(0, 1)
      subject.enliven(0, 2)
      subject.enliven(1, 0)
      subject.enliven(1, 2)
      subject.enliven(2, 0)
      subject.enliven(2, 1)

      expect(subject.live?(1, 1)).to eq(false)
    end

    it 'dies with 8' do
      subject.enliven(0, 0)
      subject.enliven(0, 1)
      subject.enliven(0, 2)
      subject.enliven(1, 0)
      subject.enliven(1, 2)
      subject.enliven(2, 0)
      subject.enliven(2, 1)
      subject.enliven(2, 2)

      expect(subject.live?(1, 1)).to eq(false)
    end

    it "doesn't wrap up beginning corner" do
      subject.enliven(9, 9)
      subject.enliven(9, 0)
      subject.display

      expect(subject.live?(0,0)).to eq(false)
    end

    it "is fine in lower corner" do
      expect(subject.live?(9,9)).to eq(false)
    end

    #it 'displays!' do
      #subject.enliven(5, 5)
      #subject.display
    #end
  end
end
