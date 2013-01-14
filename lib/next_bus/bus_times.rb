module NextBus
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
      temp_times = self.times.dup

      temp_times << time_now
      temp_times.sort!

      index = temp_times.index(time_now)
      from = times.length - index
      times[-from..from] if from > 0
    end

    def mins_till
      n_bus = next_bus
      n_bus.to_i - time_now.to_i if n_bus
    end

    private

    def time_now
      time = Time.now.strftime("%k%M") 
    end
  end
end
