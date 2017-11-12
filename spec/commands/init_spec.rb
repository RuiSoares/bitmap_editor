require 'spec_helper'
require 'commands/init'
require 'image'
require 'errors'

describe Init do
  describe '#initialize' do
    context 'when over the limit size' do
      it 'raises an image limit error' do
        expect { Init.new(['999', '999']) }.to raise_error(BitmapErrors::ImageLimitError)
      end
    end

    context 'when invalid number of arguments' do
      it 'raises a number of arguments error' do
        expect { Init.new(['argument']) }.to raise_error(BitmapErrors::NumberOfArgumentsError)
      end
    end
  end

  describe '#run' do
    it 'creates bitmap with MxN white pixels' do
      m = 6
      n = 5

      bitmap = Init.new([m,n]).run

      expect(bitmap.rows).to eq(n)
      expect(bitmap.cols).to eq(m)
      bitmap.pixels.each do |row|
        expect(row).to all(eq('O'))
      end
    end
  end
end
