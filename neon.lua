client = mqtt.client("Room 1", "mini.arsaniit.com",1883,false)
client:connect("","")

function recep(longueur, message)
hum = tonumber(message)
neoff()

if hum >= 0 and hum < 40 then
neo:setPixel(0,20,0,0)
neo:update()
print("humidite : "..hum)
end

if hum >= 40 and hum < 70 then
for i=0,3 do
neo:setPixel(i,0,20,0)
neo:update()
print("humidite : "..hum)
end
end

if hum >= 70 and hum < 100 then
for i=0,5 do
neo:setPixel(i,43,15,0)
neo:update()
print("humidite : "..hum)
end
end

if hum >= 100 then
for i=0,7 do
neo:setPixel(i,20,0,0)
neo:update()
print("humidite : "..hum)
end
end
end

client:subscribe("VMC",mqtt.QOS0,recep)