require_relative 'spec_helper'

describe BinaryImage do

  raw_image = [[1,0,0,1,0,1],
               [1,1,0,0,0,1],
               [1,1,1,1,1,1]]

  let(:image) { BinaryImage.new(raw_image) }
  subject{ image }

  describe "#initialize" do
    describe "it should correctly set the rows and columns" do
      its(:rows) { should == 3 }
      its(:columns) { should == 6 }
    end
  end

  describe "#count_segments" do
    describe "it should find all of the segments" do
      let(:number_of_segments) { image.count_segments }
      subject{ number_of_segments }

      context "before image has been segmented" do
        it { should == 1 }
      end

      context "after image has been segmented" do
        before { image.segment! }

        it { should == 2 }
      end
    end
  end
end
