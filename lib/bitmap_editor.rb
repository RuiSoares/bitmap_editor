require 'image'

class BitmapEditor
  def init_bitmap(args)
    cols, rows = args
    rows = rows.to_i
    cols = cols.to_i

    Image.new(rows, cols)
  end

  def clear(args, bitmap)
    bitmap.clear
  end

  def insert(args, bitmap)
    col, row, colour = args

    bitmap.insert(row, col, colour)
  end

  def vertical_insert(args, bitmap)
    col, start_row, end_row, colour = args
    start_row = start_row.to_i
    end_row = end_row.to_i
    col = col.to_i

    (start_row..end_row).each {|row| bitmap.insert(row, col, colour) }
  end

  def horizontal_insert(args, bitmap)
    start_col, end_col, row, colour = args
    row = row.to_i
    start_col = start_col.to_i
    end_col = end_col.to_i

    (start_col..end_col).each {|col| bitmap.insert(row, col, colour) }
  end

  def show(args, bitmap)
    bitmap.print
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp.split(' ')
      command = line.first
      args = line.drop(1)
      bitmap = nil
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
    end
  end
end
