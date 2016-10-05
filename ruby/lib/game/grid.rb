class Game
  class Grid
    def initialize(size = 10)
      @grid = size.times.map { Array.new(size) }
    end

    def enliven(row, col)
      @grid[row][col] = "*"
    end

    def dead(row, col)
      @grid[row][col] = nil
    end

    def size
      @grid.size
    end

    def live?(row, col)
      neighbors = live_neighbors(row, col)
      return neighbors == 2 || neighbors == 3
    end

    def live_neighbors(row, col)
      neighbors = []

      if row > 0
        if col > 0
          neighbors << @grid[row - 1][col - 1]
        end
        neighbors << @grid[row - 1][col]
        neighbors << @grid[row - 1][col + 1]
      end

      if col > 0
        neighbors << @grid[row][col - 1]
      end
      neighbors << @grid[row][col + 1]

      if @grid[row + 1]
        if col > 0
          neighbors << @grid[row + 1][col - 1]
        end
        neighbors << @grid[row + 1][col]
        neighbors << @grid[row + 1][col + 1]
      end

      neighbors.compact.count
    end

    def display
      puts
      @grid.each do |row|
        row.each do |cell|
          print cell || '.'
          print " "
        end
        puts
      end
      puts
    end
  end
end
