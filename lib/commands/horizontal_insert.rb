require 'commands/insertion'

class HorizontalInsert
  include Insertion

  def initialize(args, bitmap)
    raise BitmapErrors::NoBitmapError.new if bitmap.nil?
    raise BitmapErrors::NumberOfArgumentsError.new('H',4) if(args.size != 4)
    start_col, end_col, row, @colour = args
    @bitmap = bitmap
    @row = row.to_i
    @start_col = start_col.to_i
    @end_col = end_col.to_i
    unless @bitmap.in_range?(@row, @start_col) && @bitmap.in_range?(@row, @end_col)
      raise BitmapErrors::OutOfRangeError.new(@bitmap.cols, @bitmap.rows)
    end
    raise BitmapErrors::StartAfterEndError.new if @start_col > @end_col
    raise BitmapErrors::NotAColourError.new unless is_colour?(@colour)
  end

  def run
    (@start_col..@end_col).each {|col| @bitmap.insert(@row, col, @colour) }
  end
end
