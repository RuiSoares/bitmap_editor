require_relative 'insertion'
class HorizontalInsert
  include Insertion

  def initialize(args, bitmap)
    raise BitmapErrors::NoBitmapError if bitmap.nil?
    raise BitmapErrors::NumberOfArgumentsError.new('H',4) if(args.size != 4)
    start_col, end_col, row, @colour = args
    @bitmap = bitmap
    @row = row.to_i
    @start_col = start_col.to_i
    @end_col = end_col.to_i
    raise BitmapErrors::OutOfRangeError.new(@bitmap.cols, @bitmap.rows) unless @bitmap.in_range?(@row, @row, @start_col, @end_col)
    raise BitmapErrors::StartAfterEndError.new if @start_col > @end_col
    raise BitmapErrors::NotAColourError unless is_colour?(@colour)
  end

  def run
    (@start_col..@end_col).each {|col| @bitmap.insert(@row, col, @colour) }
  end
end