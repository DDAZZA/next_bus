require "next_bus/version"
require "next_bus/bus_times"

module NextBus
  BUS_TIMES = %w{1615 1637 1657 1707 1717 1737 1745 1805 1825 1845 1905}

  def self.run(*args)
    bus_times = BusTimes.new(BUS_TIMES)

    if args.include?('-a') || args.include?('--all')
      if list = bus_times.list
        'Next bus times: ' + list.join(', ')
      else
        'There are no more buses today.'
      end
    elsif args.include?('-m') || args.include?('--mins')
      if mins_until = bus_times.mins_till
      "Next bus is in #{mins_until} mins."
      else
        'There are no more buses today.'
      end
    elsif args.length == 0
      if next_bus = bus_times.next_bus
        "Next bus is at #{next_bus}"
      else
        'There are no more buses today.'
      end
    else
'Usage:
    next_bus [OPTIONS]

Options:
    -m, [--mins]              # Minutes till next bus
    -a, [--all]               # List all available buses
    -h, [--help]              # Show this message'
    end
  end
end
