require 'spec_helper'
require 'bitmap_editor'
require 'image'
require 'errors'

describe BitmapEditor do
  describe '#run' do
    path = './examples'
    Dir.foreach(path) do |filename|
      next if filename == '.' || filename == '..' || (filename =~ /\Aresult/) == 0

      it "returns right output for '#{filename}'" do
        input_file = File.open("#{path}/#{filename}", 'r')
        expected = File.read("#{path}/result_#{filename}")

        expect { BitmapEditor.new.run(input_file) }.to output(expected).to_stdout

        input_file.close
      end
    end
  end
end
