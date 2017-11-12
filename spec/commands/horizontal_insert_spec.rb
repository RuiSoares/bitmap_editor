require 'spec_helper'
require 'commands/horizontal_insert'
require 'image'
require 'errors'

describe HorizontalInsert do
  describe '#initialize' do
    context 'when invalid coordinates' do
      it 'raises an out of range error' do
        bitmap = Image.new(4,4)

        expect { HorizontalInsert.new([3,5,5,'A'], bitmap) }.to raise_error(BitmapErrors::OutOfRangeError)
      end
    end

    context 'when start after end' do
      it 'raises a start after end error' do
        bitmap = Image.new(4,4)

        expect { HorizontalInsert.new([2,1,1,'A'], bitmap) }.to raise_error(BitmapErrors::StartAfterEndError)
      end
    end

    context 'when invalid colour' do
      it 'raises an invalid colour error' do
        bitmap = Image.new(4,4)

        expect { HorizontalInsert.new([1,2,1,'Potato'], bitmap) }.to raise_error(BitmapErrors::NotAColourError)
      end
    end

    context 'when invalid number of arguments' do
      it 'raises a number of arguments error' do
        bitmap = Image.new(4,4)

        expect { HorizontalInsert.new(['argument'], bitmap) }.to raise_error(BitmapErrors::NumberOfArgumentsError)
      end
    end

    context 'when no bitmap' do
      it 'raises a no bitmap error' do
        bitmap = nil

        expect { HorizontalInsert.new([1,2,1,'A'], bitmap) }.to raise_error(BitmapErrors::NoBitmapError)
      end
    end
  end

  describe '#run' do
    it 'sets pixel with coordinates X,Y to colour C' do
      bitmap = Image.new(5,6)
      expected = Image.new(5,6)
      expected.insert(4,2,'C')
      expected.insert(4,3,'C')
      expected.insert(4,4,'C')
      x1 = 2
      x2 = 4
      y = 4
      c = 'C'

      HorizontalInsert.new([x1,x2,y,c], bitmap).run

      expect(bitmap.pixels).to eq(expected.pixels)
    end
  end
end
