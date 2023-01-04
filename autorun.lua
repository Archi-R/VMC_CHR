dofile("console.lua");

pin_led = pio.GPIO15

pin_clk = pio.GPIO21
pin_dt = pio.GPIO22
pin_sw = pio.GPIO23

pin_dht11 = pio.GPIO4

pin_servo = pio.GPIO2

tab_hum = {}

try(
	function()
		neo = neopixel.attach(neopixel.WS2812B,pin_led,8);
		dht11 = sensor.attach("DHT11", pin_dht11);
  	end,
  	function(where, line, error, message)
		print("Error in "..where.." at line "..line..": "..error.." "..message);
	end,
	function()
	end
)

function get_hum(room)
	return tab_hum[24*60]
end

thread.start (
	function ()
		while true do
			try(
				function()
					hum = dht11:read("humidity");
					for i=1, 24*60 do
						tab_hum[i-1] = tab_hum[i]; --on décale les valeurs
					end
					tab_hum[24*60] = hum
				end,
				function(where, line, error, message)
					print(message);
				end,
				function()
					tmr.delay(60)
				end
			)
		end
	end
)