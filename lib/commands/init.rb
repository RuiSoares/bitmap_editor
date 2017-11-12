BITMAP_MAX_SIZE = 250

class Init
  def initialize(args)
    raise BitmapErrors::NumberOfArgumentsError.new('I',2) if(args.size != 2)
    cols, rows = args
    @rows = rows.to_i
    @cols = cols.to_i
    if @cols < 0 || @cols > BITMAP_MAX_SIZE ||
       @rows < 0 || @rows > BITMAP_MAX_SIZE
      raise BitmapErrors::ImageLimitError.new
    end
  end

  def run
    Image.new(@rows, @cols)
  end
end
