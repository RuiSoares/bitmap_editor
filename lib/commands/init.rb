class Init
  def initialize(args)
    raise BitmapErrors::NumberOfArgumentsError.new('I',2) if(args.size != 2)
    cols, rows = args
    @rows = rows.to_i
    @cols = cols.to_i
    raise BitmapErrors::ImageLimitError.new if @cols < 0 || @cols > 250 || @rows < 0 || @rows > 250
  end

  def run
    Image.new(@rows, @cols)
  end
end
