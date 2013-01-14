require 'spec_helper'
require 'time'

describe NextBus do
  describe :run do
    context 'when run with -h param' do
      let(:help) do
'Usage:
    next_bus [OPTIONS]

Options:
    -m, [--mins]              # Minutes till next bus
    -a, [--all]               # List all available buses
    -h, [--help]              # Show this message'
      end

      it 'returns usage info' do
        described_class.run('-h').should == help
      end
    end

    context 'when the time is 11pm' do
      before :each do
        time = Time.parse('23:00')
        Time.stub(:now).and_return(time)
      end

      context 'with no params' do
        it 'returns the next bus time' do
          described_class.run.should == 'There are no more buses today.'
        end
      end

      context 'with -a param' do
        it 'returns bus times' do
          described_class.run('-a').should == 'There are no more buses today.'
        end
      end

      context 'with -m param' do
        it 'returns bus times' do
          described_class.run('-m').should == 'There are no more buses today.'
        end
      end
    end

    context 'when the time is 5pm' do
      before :each do
        time = Time.parse('17:00')
        Time.stub(:now).and_return(time)
      end

      context 'with no params' do
        it 'returns the next bus time' do
          described_class.run.should == 'Next bus is at 1707'
        end
      end

      context 'with -a param' do
        it 'returns bus times' do
          described_class.run('-a').should == 'Next bus times: 1707, 1717, 1737, 1745, 1805, 1825'
        end
      end

      context 'with -m param' do
        it 'returns bus times' do
          described_class.run('-m').should == 'Next bus is in 7 mins.'
        end
      end
    end
  end
end
