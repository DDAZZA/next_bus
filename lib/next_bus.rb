require "next_bus/version"

module NextBus
  BUS_TIMES = ['1731', '0700', '1705', '1657']

  def self.run(*args)
    bus_times = BusTimes.new(BUS_TIMES)

    if args.include?('-a')
      bus_times.list
    else
      bus_times.next_bus
    end
  end
end

class BusTimes
  attr_reader :times

  def initialize(bus_times)
    @times = bus_times.sort!
  end

  def next_bus
    temp_times = self.times.dup
    temp_times << time_now
    temp_times.sort!

    index = temp_times.index(time_now)
    self.times[index]
  end

  def list
    temp_times = times.dup

    temp_times << time_now
    temp_times.sort!

    index = temp_times.index(time_now)
    from = times.length - index
    times[-from..from]
  end

  private

  def time_now
    time = Time.now.strftime("%I%M")
  end
end
