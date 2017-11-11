class Clear
  def initialize(args, bitmap)
    raise BitmapErrors::NoBitmapError if bitmap.nil?
    raise BitmapErrors::NumberOfArgumentsError.new('C',0) if(args.size != 0)

    @bitmap = bitmap
  end

  def run
    @bitmap.clear
  end
end
