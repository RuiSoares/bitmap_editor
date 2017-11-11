class Show
  def initialize(args, bitmap)
    raise BitmapErrors::NoBitmapError.new if bitmap.nil?
    raise BitmapErrors::NumberOfArgumentsError.new('S',0) if(args.size != 0)

    @bitmap = bitmap
  end

  def run
    @bitmap.print
  end
end
