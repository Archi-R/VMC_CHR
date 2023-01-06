nb_mesures = 24*60

function get_hum(room)
	if room == 1 then
		return t1[nb_mesures]
	elseif room == 2 then
		return t2[nb_mesures]
	elseif room == 3 then
		return t3[nb_mesures]
	end
end

thread.start (
	function ()
		while true do
			try(
				function()
					hum = s:read("humidity");
					for i=1, nb_mesures do
						t1[i-1] = t1[i]; --on décale les valeurs
					end
					t1[nb_mesures] = hum
				end,
				function(where, line, error, message)
				end,
				function()
					tmr.delay(5) -- 60
				end
			)
		end
	end
)