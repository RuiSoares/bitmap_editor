require_relative 'insertion'
class Insert
  include Insertion

  def initialize(args, bitmap)
    raise BitmapErrors::NoBitmapError.new if bitmap.nil?
    raise BitmapErrors::NumberOfArgumentsError.new('L',3)  if(args.size != 3)
    col, row, @colour = args
    @bitmap = bitmap
    @row = row.to_i
    @col = col.to_i
    raise BitmapErrors::OutOfRangeError.new(@bitmap.cols, @bitmap.rows) unless @bitmap.in_range?(@row, @row, @col, @col)
    raise BitmapErrors::NotAColourError.new unless is_colour?(@colour)
  end

  def run
    @bitmap.insert(@row, @col, @colour)
  end
end
