require 'sensor'
require 'alarm'
require 'dummy_pressure'

# Write the unit tests for the Alarm class. The Alarm class is designed to monitor 
# tire pressure and set an alarm if the pressure falls outside of the expected range. 
# The Sensor class provided for the exercise fakes the behaviour of a real tire sensor, 
# providing random but realistic values.

describe "Alarm" do
  it "is off by default" do
    sut = Alarm.new(Sensor.new)
    expected = false
    
    actual = sut.is_alarm_on

    expect(actual).to eq(expected)
  end
  it "is on when pressure is lower than bottom threshold" do
    source = DummyPressureSource.new(0)
    sensor = Sensor.new(source: source)
    sut = Alarm.new(sensor)
    expected = true
    
    sut.check
    actual = sut.is_alarm_on

    expect(actual).to eq(expected)
  end
end