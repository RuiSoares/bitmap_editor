require 'spec_helper'
require_relative '../lib/bitmap_editor'
require_relative '../lib/image'
require_relative '../lib/errors'

describe BitmapEditor do
  describe 'init_bitmap' do
    it 'creates bitmap with MxN white pixels' do
      m = 6
      n = 5
      bitmap = BitmapEditor.new.init_bitmap([m,n])
      expect(bitmap.rows).to eq(n)
      expect(bitmap.cols).to eq(m)
    end

    context 'when over the limit size' do
      it 'raises an image limit error' do
        expect { BitmapEditor.new.init_bitmap(['999', '999']) }.to raise_error(BitmapErrors::ImageLimitError)
      end
    end

    context 'when invalid number of arguments' do
      it 'raises a number of arguments error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.init_bitmap(['argument']) }.to raise_error(BitmapErrors::NumberOfArgumentsError)
      end
    end
  end

  describe 'clear' do
    it 'sets all pixels of bitmap to white' do
      bitmap = Image.new(4,4)
      bitmap.insert(2,2,'F')

      expect(bitmap.pixel(2,2)).to eq 'F'
      BitmapEditor.new.clear([], bitmap)
      expect(bitmap.pixel(2,2)).to eq 'O'
    end

    context 'when invalid number of arguments' do
      it 'raises a number of arguments error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.clear(['argument'], bitmap) }.to raise_error(BitmapErrors::NumberOfArgumentsError)
      end
    end

    context 'when no bitmap' do
      it 'raises a no bitmap error' do
        bitmap = nil
        expect { BitmapEditor.new.clear([], bitmap) }.to raise_error(BitmapErrors::NoBitmapError)
      end
    end
  end

  describe 'insert' do
    it 'sets pixel with coordinates X,Y to colour C' do
      bitmap = Image.new(5,6)
      x = 4
      y = 3
      c = 'A'
      BitmapEditor.new.insert([x,y,c], bitmap)
      expect(bitmap.pixel(y,x)).to eq(c)
    end

    context 'when invalid coordinates' do
      it 'raises an out of range error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.insert([5,5,'A'], bitmap) }.to raise_error(BitmapErrors::OutOfRangeError)
      end
    end

    context 'when invalid colour' do
      it 'raises an invalid colour error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.insert([1,2,'Potato'], bitmap) }.to raise_error(BitmapErrors::NotAColourError)
      end
    end

    context 'when invalid number of arguments' do
      it 'raises a number of arguments error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.insert(['argument'], bitmap) }.to raise_error(BitmapErrors::NumberOfArgumentsError)
      end
    end

    context 'when no bitmap' do
      it 'raises a no bitmap error' do
        bitmap = nil
        expect { BitmapEditor.new.insert([1,1,'A'], bitmap) }.to raise_error(BitmapErrors::NoBitmapError)
      end
    end
  end

  describe 'vertical_insert' do
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
      BitmapEditor.new.vertical_insert([x,y1,y2,c], bitmap)
      expect(bitmap.pixels).to eq(expected.pixels)
    end

    context 'when invalid coordinates' do
      it 'raises an out of range error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.vertical_insert([5,3,5,'A'], bitmap) }.to raise_error(BitmapErrors::OutOfRangeError)
      end
    end

    context 'when start after end' do
      it 'raises a start after end error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.vertical_insert([1,2,1,'A'], bitmap) }.to raise_error(BitmapErrors::StartAfterEndError)
      end
    end

    context 'when invalid colour' do
      it 'raises an invalid colour error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.vertical_insert([1,1,2,'Potato'], bitmap) }.to raise_error(BitmapErrors::NotAColourError)
      end
    end

    context 'when invalid number of arguments' do
      it 'raises a number of arguments error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.vertical_insert(['argument'], bitmap) }.to raise_error(BitmapErrors::NumberOfArgumentsError)
      end
    end

    context 'when no bitmap' do
      it 'raises a no bitmap error' do
        bitmap = nil
        expect { BitmapEditor.new.vertical_insert([1,1,2,'A'], bitmap) }.to raise_error(BitmapErrors::NoBitmapError)
      end
    end
  end

  describe 'horizontal_insert' do
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
      BitmapEditor.new.horizontal_insert([x1,x2,y,c], bitmap)
      expect(bitmap.pixels).to eq(expected.pixels)
    end

    context 'when invalid coordinates' do
      it 'raises an out of range error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.horizontal_insert([3,5,5,'A'], bitmap) }.to raise_error(BitmapErrors::OutOfRangeError)
      end
    end

    context 'when start after end' do
      it 'raises a start after end error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.horizontal_insert([2,1,1,'A'], bitmap) }.to raise_error(BitmapErrors::StartAfterEndError)
      end
    end

    context 'when invalid colour' do
      it 'raises an invalid colour error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.horizontal_insert([1,2,1,'Potato'], bitmap) }.to raise_error(BitmapErrors::NotAColourError)
      end
    end

    context 'when invalid colour' do
      it 'raises a number of arguments error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.insert([1,2,'Potato'], bitmap) }.to raise_error(BitmapErrors::NotAColourError)
      end
    end

    context 'when invalid number of arguments' do
      it 'raises a number of arguments error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.horizontal_insert(['argument'], bitmap) }.to raise_error(BitmapErrors::NumberOfArgumentsError)
      end
    end

    context 'when no bitmap' do
      it 'raises a no bitmap error' do
        bitmap = nil
        expect { BitmapEditor.new.horizontal_insert([1,2,1,'A'], bitmap) }.to raise_error(BitmapErrors::NoBitmapError)
      end
    end
  end

  describe 'show' do
    it 'prints the bitmap' do
      bitmap = Image.new(4,4)
      expected = "OOOO\nOOOO\nOOOO\nOOOO\n"
      expect { BitmapEditor.new.show([], bitmap) }.to output(expected).to_stdout
    end

    context 'when invalid number of arguments' do
      it 'raises a number of arguments error' do
        bitmap = Image.new(4,4)
        expect { BitmapEditor.new.show(['argument'], bitmap) }.to raise_error(BitmapErrors::NumberOfArgumentsError)
      end
    end

    context 'when no bitmap' do
      it 'raises a no bitmap error' do
        bitmap = nil
        expect { BitmapEditor.new.show([], bitmap) }.to raise_error(BitmapErrors::NoBitmapError)
      end
    end
  end
end
