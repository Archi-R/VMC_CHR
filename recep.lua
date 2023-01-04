function recep() 
    -- function to recept the different values from the topic "VMC". 
    
    -- first, we need to connect to the client
    client = mqtt.client("Interface","mini.arsaniit.com",1883,false) 
    client:connect("","") 
    
    function message_received(length,data) 
        room,measure = pack.unpack(data) 
        -- depending on the room value, we append the measur in the good 
        -- table.
        -- the tables t1,t2,t3 can be created in teh autorun file and edited in this file.
        if room == 1 then
            table.insert(t1,measure) 
        end 
        
        if room ==  2 then 
            table.insert(t2,measure) 
        end 
    
        if room == 3 then 
            table.insert(t3,measure) 
        end 
    end 
    
    -- we subscribe to the related topic and execute the previous
    -- function if a message if received
    client:subscribe("VMC",mqtt.QOS0,message_received) 
    
    end 
