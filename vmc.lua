function vmc()

-- function which measure every 10 seconds the value of the 
-- humidity in the room where the sensor is. Also, it send every
-- value on a dedied broker. 

-- The message are hashed so that we can include the room number
-- and the measure in one message. 
-- (we use the method pack.pack() )


-- connecting to mqqt client: 
client = mqtt.client("Room 1","mini.arsaniit.com",1883,false)
client:connect("","")
roomnb = 1 -- defining the room number
on = True -- stop condition to the loop

while true do 

measure = false
while not measure do
try(
function()
humidity = s:read("humidity") -- measuring humidity
measure = true
end,
function()
tmr.delay(1)
end,
function()
end
)
end

humidity = s:read("humidity") -- measuring humidity

data = pack.pack(roomnb,humidity) -- hashing the values

client:publish("VMC",data,mqtt.QOS0) -- publishing on topic

-- motor section : 
if humidity < 40 then -- first case : very low percentage   
m:write(90) -- nearly closing

end 

if humidity >= 40 and humidity < 70 then 
-- second case : "normal" percentage
m:write(100) -- quite open

end

if humidity >= 70 and humidity < 100 then 
-- third case : quite high percentage
m:write(150) -- globally open

end

if humidity > 100 then -- fourth case : very high percentage
m:write(180) -- totally open
 
end

tmr.delay(10) -- delay before next measure.

end 


end 