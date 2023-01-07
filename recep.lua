function recep() 
    -- function to recept the different values from the topic "VMC". 
        
    -- first, we need to connect to the client
    client = mqtt.client("Interface","mini.arsaniit.com",1883,false) 
    client:connect("","") 
        
    function message_received(length,data) 
        room,measure = pack.unpack(data) 
        -- depending on the room value, we append the measur in the good 
        -- table.
        -- the tables t1,t2,t3 can be created in the autorun file and edited in this file.
        if room == 1 then
            humP1 = measure 
        end 
                
        if room ==  2 then 
            humP2 = measure 
        end

        if room == 3 then
            humP3 = measure
        end
        print("room "..room.." : "..measure);
    end 
    
    -- we subscribe to the related topic and execute the previous
    -- function if a message if received
    client:subscribe("VMC",mqtt.QOS0,message_received) 
        
end 


function get_hum(room)
    if room == 1 then
        return humP1
    elseif room == 2 then
        return humP2
    elseif room == 3 then
        return humP3
    end
end