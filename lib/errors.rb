module BitmapErrors
  class NoBitmapError < StandardError
    def message
      "There is no bitmap created"
    end
  end

  class NumberOfArgumentsError < StandardError
    def initialize(command, number)
      @command = command
      @number = number
    end

    def message
      "invalid number of arguments for #{@command}, expected #{@number}"
    end
  end

  class ImageLimitError < StandardError
    def message
      "M and N should be integers between 1 and 250"
    end
  end

  class OutOfRangeError < StandardError
    def initialize(cols, rows)
      @cols = cols
      @rows = rows
    end

    def message
      "Coordinates must be inside image dimensions (#{@cols},#{@rows})"
    end
  end

  class StartAfterEndError < StandardError
    def message
      "End must be greater than Start"
    end
  end

  class NotAColourError < StandardError
    def message
      "Colour (C) must be a capital letter"
    end
  end

  class InvalidCommand < StandardError
    def message
      "Invalid command, accepted commands are:\n"\
      "I M N - Create a new M x N image with all pixels coloured white (O).\n"\
      "C - Clears the table, setting all pixels to white (O).\n"\
      "L X Y C - Colours the pixel (X,Y) with colour C.\n"\
      "V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).\n"\
      "H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).\n"\
      "S - Show the contents of the current image"
    end
  end
end
