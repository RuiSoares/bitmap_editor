require 'spec_helper'
require 'commands/show'
require 'image'
require 'errors'

describe Show do
  describe '#initialize' do
    context 'when invalid number of arguments' do
      it 'raises a number of arguments error' do
        bitmap = Image.new(4,4)

        expect { Show.new(['argument'], bitmap) }.to raise_error(BitmapErrors::NumberOfArgumentsError)
      end
    end

    context 'when no bitmap' do
      it 'raises a no bitmap error' do
        bitmap = nil

        expect { Show.new([], bitmap) }.to raise_error(BitmapErrors::NoBitmapError)
      end
    end
  end

  describe '#run' do
    it 'prints the bitmap' do
      bitmap = Image.new(4,4)
      expected = "OOOO\nOOOO\nOOOO\nOOOO\n"

      expect { Show.new([], bitmap).run }.to output(expected).to_stdout
    end
  end
end
