require_relative 'image'
require_relative 'errors'
require_relative 'commands/init'
require_relative 'commands/clear'
require_relative 'commands/insert'
require_relative 'commands/vertical_insert'
require_relative 'commands/horizontal_insert'
require_relative 'commands/show'

#TODO fix requires

class BitmapEditor
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
          bitmap = Init.new(args).run
        when 'C'
          Clear.new(args, bitmap).run
        when 'L'
          Insert.new(args, bitmap).run
        when 'V'
          VerticalInsert.new(args, bitmap).run
        when 'H'
          HorizontalInsert.new(args, bitmap).run
        when 'S'
          Show.new(args, bitmap).run
        else
          raise BitmapErrors::InvalidCommand.new
        end
      rescue => error
        puts "Line #{index}: " + error.message
      end
    end
  end
end
