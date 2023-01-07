function fakedht11()
	-- initialisation
	prec_ = 0
	suiv_ = 0

	function lec_(direc, counter, button) --fonction appelée par l'encodeur
		if (direc == 1) then
			if (prec_ < 150) then
				suiv_ = prec_ + 1;
			end
		elseif (direc == 0) then
			if (prec > 0) then
				suiv = prec- 1;
			end
		end
		hum_ = suiv_
		data_ = pack.pack(3,hum_) -- hashing the values
		client:publish("VMC",data_,mqtt.QOS0) -- publishing on topic
		prec_ = suiv_;
	end
	enc = encoder.attach(pin_clk, pin_dt, pin_sw, lec);
	

end
fakedht11();