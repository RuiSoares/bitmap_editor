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

  def to_s
    pixels.map {|row| row.join }.join("\n") + "\n"
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

  def in_range?(row, col)
    row > 0 &&
    row <= rows &&
    col > 0 &&
    col <= cols
  end
end
