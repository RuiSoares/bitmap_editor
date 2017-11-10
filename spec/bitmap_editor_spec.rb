require 'spec_helper'
require_relative '../lib/bitmap_editor'

describe BitmapEditor do
  describe 'init_bitmap' do
    it 'creates bitmap with MxN white pixels' do
      m = 6
      n = 5
      bitmap = BitmapEditor.new.init_bitmap([m,n])
      expect(bitmap.size).to eq(n)
      expect(bitmap.first.size).to eq(m)
    end
  end

  describe 'clear' do
    it 'sets all pixels of bitmap to white' do
      bitmap = Array.new(5) { Array.new(6) {'O'}}
      bitmap[3][3] = 'F'
      bitmap = BitmapEditor.new.clear([], bitmap)
      expect(bitmap[3][3]).to eq 'O'
    end
  end

  describe 'insert' do
    it 'sets pixel with coordinates X,Y to colour C' do
      bitmap = Array.new(5) { Array.new(6) {'O'}}
      x = 4
      y = 3
      c = 'A'
      BitmapEditor.new.insert([x,y,c], bitmap)
      expect(bitmap[y-1][x-1]).to eq(c)
    end
  end

  describe 'vertical_insert' do
    it 'sets pixel with coordinates X,Y to colour C' do
      bitmap = Array.new(5) { Array.new(6) {'O'}}
      expected = Array.new(5) { Array.new(6) {'O'}}
      expected[2][3] = 'B'
      expected[3][3] = 'B'
      expected[4][3] = 'B'
      x = 4
      y1 = 3
      y2 = 5
      c = 'B'
      BitmapEditor.new.vertical_insert([x,y1,y2,c], bitmap)
      expect(bitmap).to eq(expected)
    end
  end

  describe 'horizontal_insert' do
    it 'sets pixel with coordinates X,Y to colour C' do
      bitmap = Array.new(5) { Array.new(6) {'O'}}
      expected = Array.new(5) { Array.new(6) {'O'}}
      expected[1][1] = 'C'
      expected[1][2] = 'C'
      expected[1][3] = 'C'
      x1 = 2
      x2 = 4
      y = 2
      c = 'C'
      BitmapEditor.new.horizontal_insert([x1,x2,y,c], bitmap)
      expect(bitmap).to eq(expected)
    end
  end

  describe 'show' do
    it 'prints the bitmap' do
      bitmap = Array.new(4) { Array.new(4) {'O'}}
      bitmap[0][0] = 'F'
      expected = "FOOO\nOOOO\nOOOO\nOOOO\n"
      expect { BitmapEditor.new.show([], bitmap) }.to output(expected).to_stdout
    end
  end
end
