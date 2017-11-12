require 'image'
require 'errors'
require 'commands/init'
require 'commands/clear'
require 'commands/insert'
require 'commands/vertical_insert'
require 'commands/horizontal_insert'
require 'commands/show'

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
