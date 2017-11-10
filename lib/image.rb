class Image
  def initialize(rows,cols)
    @pixels = Array.new(rows) { Array.new(cols) {'O'}}
    @rows = rows
    @cols = cols
  end

  def insert(row, col, colour)
    @pixels[row-1][col-1] = colour
  end

  def pixel(row, col)
    @pixels[row-1][col-1]
  end

  def clear
    @pixels = Array.new(@rows) { Array.new(@cols) {'O'}}
  end

  def print
    @pixels.each do |row|
      puts row.join
    end
  end

  def rows
    @rows
  end

  def cols
    @cols
  end

  def pixels
    @pixels
  end
end
