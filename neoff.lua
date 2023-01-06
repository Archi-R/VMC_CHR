function neoff()
    -- switchin of the whole led bar
    for i=0,7 do 
        neo:setPixel(i,0,0,0) 
    end 
    -- updating
    neo:update()
end