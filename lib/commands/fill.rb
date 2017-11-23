require 'commands/insertion'
require 'pry'

class Fill
  include Insertion

  def initialize(args, bitmap)
    raise BitmapErrors::NoBitmapError.new if bitmap.nil?
    raise BitmapErrors::NumberOfArgumentsError.new('F',3)  if(args.size != 3)
    col, row, @colour = args
    @bitmap = bitmap
    @row = row.to_i
    @col = col.to_i
    raise BitmapErrors::OutOfRangeError.new(@bitmap.cols, @bitmap.rows) unless @bitmap.in_range?(@row, @col)
    raise BitmapErrors::NotAColourError.new unless is_colour?(@colour)
  end

  def run
    fill(@row, @col, @colour)
  end

  private

  def fill(row, col, colour)
    current_colour = @bitmap.pixel(row, col)
    @bitmap.insert(row, col, colour)

    fill(row, col+1, colour) if is_fillable?(row, col+1, current_colour)
    fill(row, col-1, colour) if is_fillable?(row, col-1, current_colour)
    fill(row+1, col, colour) if is_fillable?(row+1, col, current_colour)
    fill(row-1, col, colour) if is_fillable?(row-1, col, current_colour)
  end

  def is_fillable?(row, col, colour)
    @bitmap.in_range?(row, col) && @bitmap.pixel(row, col) == colour
  end
end
