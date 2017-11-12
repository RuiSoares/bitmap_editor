require 'spec_helper'
require 'commands/insert'
require 'image'
require 'errors'

describe Insert do
  describe '#initialize' do
    context 'when invalid coordinates' do
      it 'raises an out of range error' do
        bitmap = Image.new(4,4)

        expect { Insert.new([5,5,'A'], bitmap) }.to raise_error(BitmapErrors::OutOfRangeError)
      end
    end

    context 'when invalid colour' do
      it 'raises an invalid colour error' do
        bitmap = Image.new(4,4)

        expect { Insert.new([1,2,'Potato'], bitmap) }.to raise_error(BitmapErrors::NotAColourError)
      end
    end

    context 'when invalid number of arguments' do
      it 'raises a number of arguments error' do
        bitmap = Image.new(4,4)

        expect { Insert.new(['argument'], bitmap) }.to raise_error(BitmapErrors::NumberOfArgumentsError)
      end
    end

    context 'when no bitmap' do
      it 'raises a no bitmap error' do
        bitmap = nil

        expect { Insert.new([1,1,'A'], bitmap) }.to raise_error(BitmapErrors::NoBitmapError)
      end
    end
  end

  describe '#run' do
    it 'sets pixel with coordinates X,Y to colour C' do
      bitmap = Image.new(5,6)
      x = 4
      y = 3
      c = 'A'

      Insert.new([x,y,c], bitmap).run

      expect(bitmap.pixel(y,x)).to eq(c)
    end
  end
end
