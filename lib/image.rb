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
    pixels.each do |row|
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

  def in_range?(start_row, end_row, start_col, end_col)
    start_row > 0 &&
    end_row <= rows &&
    start_col > 0 &&
    end_col <= cols
  end
end
