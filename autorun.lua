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
--ronan
dofile("encoder.lua")
dofile("sensor_local.lua")
dofile("screen.lua")

-- -----------------

try(
	function()
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

m:write(90) -- base status of the motor

-- -----------------

-- affichage des net stats
tmr.delay(2)
print(net.stat())


-- on eteint la barre de led

-- creation des tables, servant respectivment pour les pieces 1,2 et 3.
humP1 = 0
humP2 = 0
maxrooms = 2

neoff()