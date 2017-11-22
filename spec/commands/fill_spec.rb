require 'spec_helper'
require 'commands/fill'
require 'image'
require 'errors'

describe Init do
  describe '#initialize' do
    context 'when invalid coordinates' do
      it 'raises an out of range error' do
        bitmap = Image.new(4,4)

        expect { Fill.new([5,5,'A'], bitmap) }.to raise_error(BitmapErrors::OutOfRangeError)
      end
    end

    context 'when invalid colour' do
      it 'raises an invalid colour error' do
        bitmap = Image.new(4,4)

        expect { Fill.new([1,2,'Potato'], bitmap) }.to raise_error(BitmapErrors::NotAColourError)
      end
    end

    context 'when invalid number of arguments' do
      it 'raises a number of arguments error' do
        bitmap = Image.new(4,4)

        expect { Fill.new(['argument'], bitmap) }.to raise_error(BitmapErrors::NumberOfArgumentsError)
      end
    end
  end

  describe '#run' do
    # it 'fills 1x1 bitmap starting from x,y with B pixels' do
    #   bitmap = Image.new(1,1)
    #
    #   Fill.new([1,1,'B'], bitmap).run
    #   expect(bitmap.pixel(1,1)).to eq('B')
    # end
    #
    # it 'fills 1x2 bitmap starting from x,y with B pixels' do
    #   bitmap = Image.new(1,2)
    #
    #   Fill.new([1,1,'B'], bitmap).run
    #   expect(bitmap.pixel(1,1)).to eq('B')
    #   expect(bitmap.pixel(1,2)).to eq('B')
    # end
    #
    # it 'fills 1x3 bitmap starting from x,y with B pixels' do
    #   bitmap = Image.new(1,3)
    #   bitmap.insert(1,2,'D')
    #
    #   Fill.new([1,1,'B'], bitmap).run
    #   expect(bitmap.pixel(1,1)).to eq('B')
    #   expect(bitmap.pixel(1,2)).to eq('D')
    #   expect(bitmap.pixel(1,3)).to eq('O')
    # end

    it 'fills 1x3 bitmap starting from x,y with B pixels' do
      bitmap = Image.new(3,5)
      bitmap.insert(1,2,'F')
      bitmap.insert(3,2,'F')
      bitmap.insert(2,4,'F')
      bitmap.insert(3,4,'F')

      Fill.new([1,1,'B'], bitmap).run

      expect(bitmap.to_s).to eq <<~IMG
        BFBBB
        BBBFB
        BFBFB
      IMG
    end
  end
end
