require 'game/grid'

class Game
  attr_accessor :grid

  def initialize
    @grid = Game::Grid.new
    @grid.enliven(4, 4)
    @grid.enliven(4, 5)
    @grid.enliven(4, 6)
    @grid.enliven(5, 5)
  end

  def run
    loop do
      display
      gets
      step
    end
  end

  def step
    new_grid = Game::Grid.new
    @grid.size.times do |row|
      @grid.size.times do |col|
        if @grid.live?(row, col)
          new_grid.enliven(row, col)
        end
      end
    end
    @grid = new_grid
  end

  def display
    puts "\e[H\e[2J"
    @grid.display
  end

end
