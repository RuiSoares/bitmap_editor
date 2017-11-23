require 'spec_helper'
require 'image'

describe Image do
  describe '#init' do
    it 'generates a new all white bitmap' do
      rows = 4
      cols = 5

      image = Image.new(rows, cols)

      expect(image.rows).to eq(rows)
      expect(image.cols).to eq(cols)
    end
  end

  describe '#insert' do
    it 'inserts colour in coordinates' do
      row = 2
      col = 3
      colour = 'C'
      image = Image.new(4,5)

      image.insert(row, col, colour)

      expect(image.pixel(row,col)).to eq(colour)
    end
  end

  describe '#clear' do
    it 'resets all pixels of image to white' do
      expected = Image.new(5,5).pixels
      image = Image.new(5,5)
      image.pixels[2][2] = 'F'

      expect(image.pixels).to_not eq(expected)

      image.clear

      expect(image.pixels).to eq(expected)
    end
  end

  describe '#print' do
    it 'prints the pixels of the image' do
      image = Image.new(2,2)

      expect { image.print }.to output("OO\nOO\n").to_stdout

    end
  end

  describe '#in_range?' do
    context 'when coordinates outside of image range' do
      it 'returns false' do
        image = Image.new(4,5)

        expect(image.in_range?(6,6)).to be false
      end
    end

    context 'when coordinates inside of image range' do
      it 'returns true' do
        image = Image.new(4,5)

        expect(image.in_range?(2,4)).to be true
      end
    end
  end
end
