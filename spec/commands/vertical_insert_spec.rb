require 'spec_helper'
require_relative '../../lib/commands/vertical_insert'
require_relative '../../lib/image'
require_relative '../../lib/errors'

describe VerticalInsert do
  describe '#initialize' do
    context 'when invalid coordinates' do
      it 'raises an out of range error' do
        bitmap = Image.new(4,4)

        expect { VerticalInsert.new([5,3,5,'A'], bitmap) }.to raise_error(BitmapErrors::OutOfRangeError)
      end
    end

    context 'when start after end' do
      it 'raises a start after end error' do
        bitmap = Image.new(4,4)

        expect { VerticalInsert.new([1,2,1,'A'], bitmap) }.to raise_error(BitmapErrors::StartAfterEndError)
      end
    end

    context 'when invalid colour' do
      it 'raises an invalid colour error' do
        bitmap = Image.new(4,4)

        expect { VerticalInsert.new([1,1,2,'Potato'], bitmap) }.to raise_error(BitmapErrors::NotAColourError)
      end
    end

    context 'when invalid number of arguments' do
      it 'raises a number of arguments error' do
        bitmap = Image.new(4,4)

        expect { VerticalInsert.new(['argument'], bitmap) }.to raise_error(BitmapErrors::NumberOfArgumentsError)
      end
    end

    context 'when no bitmap' do
      it 'raises a no bitmap error' do
        bitmap = nil

        expect { VerticalInsert.new([1,1,2,'A'], bitmap) }.to raise_error(BitmapErrors::NoBitmapError)
      end
    end
  end

  describe '#run' do
    it 'sets pixel with coordinates X,Y to colour C' do
      bitmap = Image.new(5,6)
      expected = Image.new(5,6)
      expected.insert(2,4,'B')
      expected.insert(3,4,'B')
      expected.insert(4,4,'B')
      x = 4
      y1 = 2
      y2 = 4
      c = 'B'

      VerticalInsert.new([x,y1,y2,c], bitmap).run

      expect(bitmap.pixels).to eq(expected.pixels)
    end
  end
end
