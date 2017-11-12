require 'spec_helper'
require 'commands/clear'
require 'image'
require 'errors'

describe Clear do
  describe '#initialize' do
    context 'when invalid number of arguments' do
      it 'raises a number of arguments error' do
        bitmap = Image.new(4,4)

        expect { Clear.new(['argument'], bitmap) }.to raise_error(BitmapErrors::NumberOfArgumentsError)
      end
    end

    context 'when no bitmap' do
      it 'raises a no bitmap error' do
        bitmap = nil

        expect { Clear.new([], bitmap) }.to raise_error(BitmapErrors::NoBitmapError)
      end
    end
  end

  describe '#run' do
    it 'sets all pixels of bitmap to white' do
      bitmap = Image.new(4,4)
      bitmap.insert(2,2,'F')

      Clear.new([], bitmap).run

      expect(bitmap.pixel(2,2)).to eq 'O'
    end
  end
end
