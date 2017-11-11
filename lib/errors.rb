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
      "C must be a capital letter"
    end
  end
end
