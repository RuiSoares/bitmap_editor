require_relative 'image'
require_relative 'errors'

#TODO use command classes?

class BitmapEditor
  def init_bitmap(args)
    raise BitmapErrors::NumberOfArgumentsError.new('I',2) if(args.size != 2)
    cols, rows = args
    rows = rows.to_i
    cols = cols.to_i
    raise BitmapErrors::ImageLimitError if cols < 0 || cols > 250 || rows < 0 || rows > 250

    Image.new(rows, cols)
  end

  def clear(args, bitmap)
    raise BitmapErrors::NoBitmapError if bitmap.nil?
    raise BitmapErrors::NumberOfArgumentsError.new('C',0) if(args.size != 0)

    bitmap.clear
  end

  def insert(args, bitmap)
    raise BitmapErrors::NoBitmapError if bitmap.nil?
    raise BitmapErrors::NumberOfArgumentsError.new('L',3)  if(args.size != 3)
    col, row, colour = args
    row = row.to_i
    col = col.to_i
    raise BitmapErrors::OutOfRangeError.new(bitmap.cols, bitmap.rows) unless bitmap.in_range?(row, row, col, col)
    raise BitmapErrors::NotAColourError unless is_colour?(colour)

    bitmap.insert(row, col, colour)
  end

  def vertical_insert(args, bitmap)
    raise BitmapErrors::NoBitmapError if bitmap.nil?
    raise BitmapErrors::NumberOfArgumentsError.new('V',4) if(args.size != 4)
    col, start_row, end_row, colour = args
    start_row = start_row.to_i
    end_row = end_row.to_i
    col = col.to_i
    raise BitmapErrors::OutOfRangeError.new(bitmap.cols, bitmap.rows) unless bitmap.in_range?(start_row, end_row, col, col)
    raise BitmapErrors::StartAfterEndError.new if start_row > end_row
    raise BitmapErrors::NotAColourError unless is_colour?(colour)

    (start_row..end_row).each {|row| bitmap.insert(row, col, colour) }
  end

  def horizontal_insert(args, bitmap)
    raise BitmapErrors::NoBitmapError if bitmap.nil?
    raise BitmapErrors::NumberOfArgumentsError.new('H',4) if(args.size != 4)
    start_col, end_col, row, colour = args
    row = row.to_i
    start_col = start_col.to_i
    end_col = end_col.to_i
    raise BitmapErrors::OutOfRangeError.new(bitmap.cols, bitmap.rows) unless bitmap.in_range?(row, row, start_col, end_col)
    raise BitmapErrors::StartAfterEndError.new if start_col > end_col
    raise BitmapErrors::NotAColourError unless is_colour?(colour)

    (start_col..end_col).each {|col| bitmap.insert(row, col, colour) }
  end

  def show(args, bitmap)
    raise BitmapErrors::NoBitmapError if bitmap.nil?
    raise BitmapErrors::NumberOfArgumentsError.new('S',0) if(args.size != 0)

    bitmap.print
  end

  def is_colour?(colour)
    (colour =~ /\A[A-Z]\z/) == 0
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    bitmap = nil
    File.open(file).each_with_index do |line, index|
      line = line.chomp.split(' ')
      command = line.first
      args = line.drop(1)
      begin
        case command
        when 'I'
          bitmap = init_bitmap(args)
        when 'C'
          clear(args, bitmap)
        when 'L'
          insert(args, bitmap)
        when 'V'
          vertical_insert(args, bitmap)
        when 'H'
          horizontal_insert(args, bitmap)
        when 'S'
          show(args, bitmap)
        else
          puts 'unrecognised command :('
        end
      rescue => error
        puts "Line #{index}: " + error.message
      end
    end
  end
end
