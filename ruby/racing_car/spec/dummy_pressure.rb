class DummyPressureSource
    def initialize(pressure)
        @pressure = pressure
    end

    def sample_pressure
        @pressure
    end
end