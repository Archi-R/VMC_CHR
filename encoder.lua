function switch_room()
	-- initialisation

	prec = 0
	suiv = 0
	switch = true --variable allant servir poue allumer/éteindre les leds et l'écran
	neoff() -- éteindre les leds
	sensibility = 4;
	

	function lec(direc, counter, button) --fonction appelée par l'encodeur
		if (button == 1) then 
			switch = not switch -- changement
		end
		if (switch) then -- seulement si les leds sont allumées
			if (direc == 1) then
				if (prec < (maxrooms*sensibility-1)) then
					suiv = prec + 1;
				end
			elseif (direc == -1) then
				if (prec > 0) then
					suiv = prec- 1;
				end
			end
			
			humitab = 1+(suiv//sensibility);
			humidi = get_hum(humitab)
			affiche_hum_piece(humitab, humidi);
			neopix(humidi);
			
			
			
			prec = suiv;
		else -- sinon on éteint la led et l'écran
			neoff();
			cls();
		end
	end
	enc = encoder.attach(pin_clk, pin_dt, pin_sw, lec);
	

end
switch_room();