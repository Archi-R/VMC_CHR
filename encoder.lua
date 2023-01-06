

function switch_room()
	-- initialisation
	prec = 0
	suiv = 0
	switch = true --variable allant servir poue allumer/éteindre les leds et l'écran
	-- neo:setPixel(suiv, r, v, b); -- TODO
	-- neo:update();
	

	function lec(dir, counter, button) --fonction appelée par l'encodeur
		if (button == 1) then 
			switch = not switch -- changement
		end
		if (switch) then -- seulement si les leds sont allumées
			if (dir == 1) then
				if (prec < max_rooms) then
					suiv = prec + 1;
				end
			elseif (dir == -1) then
				if (prec > 0) then
					suiv = prec- 1;
				end
			end
			-- TODO afficher valeur piece
			-- r,v,b = wheelRGB((suiv*255)//8);
			-- neo:setPixel(prec, 0, 0, 0);
			-- neo:setPixel(suiv, r, v, b);
			affiche_hum_piece(suiv, get_hum(suiv));
			
			prec = suiv;
		else -- sinon on éteint la led et l'écran
			-- neo:setPixel(suiv, 0, 0, 0);
			-- neo:update();
			cls();
		end
	end
	enc = encoder.attach(pin_clk, pin_dt, pin_sw, lec);
	

end
switch_room();