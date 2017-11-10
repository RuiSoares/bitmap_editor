class BitmapEditor
  def number_of_cols(bitmap)
    bitmap.first.size
  end

  def number_of_rows(bitmap)
    bitmap.size
  end

  def init_bitmap(args)
    cols, rows = args
    rows = rows.to_i
    cols = cols.to_i

    Array.new(rows) { Array.new(cols) {'O'}}
  end

  def clear(args, bitmap)
    rows = number_of_rows(bitmap)
    cols = number_of_cols(bitmap)
    Array.new(rows) { Array.new(cols) {'O'}}
  end

  def insert(args, bitmap)
    col, row, colour = args
    row = row.to_i - 1
    col = col.to_i - 1

    bitmap[row][col] = colour
  end

  def vertical_insert(args, bitmap)
    col, start_row, end_row, colour = args
    start_row = start_row.to_i - 1
    end_row = end_row.to_i - 1
    col = col.to_i - 1

    (start_row..end_row).each {|row| bitmap[row][col] = colour }
  end

  def horizontal_insert(args, bitmap)
    start_col, end_col, row, colour = args
    row = row.to_i - 1
    start_col = start_col.to_i - 1
    end_col = end_col.to_i - 1

    (start_col..end_col).each {|col| bitmap[row][col] = colour }
  end

  def show(args, bitmap)
    bitmap.each do |row|
      puts row.join
    end
  end

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp.split(' ')
      command = line.first
      args = line.drop(1)
      current_bitmap = []
      case command
        when 'I'
          current_bitmap = init_bitmap(args)
        when 'C'
          current_bitmap = clear(args, current_bitmap)
        when 'L'
          insert(args, current_bitmap)
        when 'V'
          vertical_insert(args, current_bitmap)
        when 'H'
          horizontal_insert(args, current_bitmap)
        when 'S'
          show(args, current_bitmap)
        else
            puts 'unrecognised command :('
        end
    end
  end
end
