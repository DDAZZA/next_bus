require 'spec_helper'

describe NextBus do
  describe :run do
    context 'when run with no params' do
      it 'returns the next bus time' do
        described_class.run.should == '1705'
      end
    end

    context 'when run with -a param' do
      described_class.run('-a').should == [1657, 1705, 1731]
    end
  end
end
