require 'spec_helper'
require_relative '../lib/bitmap_editor'
require_relative '../lib/image'

describe BitmapEditor do
  describe 'init_bitmap' do
    it 'creates bitmap with MxN white pixels' do
      m = 6
      n = 5
      bitmap = BitmapEditor.new.init_bitmap([m,n])
      expect(bitmap.rows).to eq(n)
      expect(bitmap.cols).to eq(m)
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
  end

  describe 'show' do
    it 'prints the bitmap' do
      bitmap = Image.new(4,4)
      expected = "OOOO\nOOOO\nOOOO\nOOOO\n"
      expect { BitmapEditor.new.show([], bitmap) }.to output(expected).to_stdout
    end
  end
end
