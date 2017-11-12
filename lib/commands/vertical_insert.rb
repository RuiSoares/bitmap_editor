require 'commands/insertion'

class VerticalInsert
  include Insertion

  def initialize(args, bitmap)
    raise BitmapErrors::NoBitmapError.new if bitmap.nil?
    raise BitmapErrors::NumberOfArgumentsError.new('V',4) if(args.size != 4)
    col, start_row, end_row, @colour = args
    @bitmap = bitmap
    @start_row = start_row.to_i
    @end_row = end_row.to_i
    @col = col.to_i
    raise BitmapErrors::OutOfRangeError.new(@bitmap.cols, @bitmap.rows) unless @bitmap.in_range?(@start_row, @end_row, @col, @col)
    raise BitmapErrors::StartAfterEndError.new if @start_row > @end_row
    raise BitmapErrors::NotAColourError.new unless is_colour?(@colour)
  end

  def run
    (@start_row..@end_row).each {|row| @bitmap.insert(row, @col, @colour) }
  end
end
