-- port definition section
pin_led = pio.GPIO15
pin_clk = pio.GPIO21
pin_dt = pio.GPIO22
pin_sw = pio.GPIO23
pin_dht11 = pio.GPIO4
pin_servo = pio.GPIO2

-- -----------------
-- dofile section

dofile("console.lua")
dofile("publish.lua")
dofile("publish_temp.lua")
dofile("vmc.lua")
dofile("neon.lua")
dofile("neoff.lua")
dofile("recep.lua")
--ronan
dofile("encoder.lua")
dofile("sensor_local.lua")
dofile("screen.lua")

-- -----------------

try(
	function()
		-- trying to attach the sensor, motor and led bar
		neo = neopixel.attach(neopixel.WS2812B,pin_led,8);
		s = sensor.attach("DHT11", pin_dht11);
		m=servo.attach(pio.GPIO2);
  	end,
  	function(where, line, error, message)
		print("Error in "..where.." at line "..line..": "..error.." "..message);
	end,
	function()
	end
)

m:write(90) -- base status of the motor, 90 degrees correspond to the "closed" position

-- -----------------

-- printing net stats
tmr.delay(2)
print(net.stat())


-- Switching off the whole led bar
neoff()

-- Creating the different tables, used for saving the humidity values over time
t = {}
t1 = {}

max_rooms = 2