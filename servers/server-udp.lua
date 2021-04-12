local socket = require("socket")

print("Starting UDP demo-server on port 12345")

local udp, err = socket.udp()
udp:setsockname('*', 12345)
udp:settimeout(0)

local running = true
while running do
  local data, msg_or_ip, port_or_nil = udp:receivefrom()
  if data then
    print("OK: " .. msg_or_ip .. " - " .. data)
    udp:sendto(data, msg_or_ip, port_or_nil)
  else
    if msg_or_ip ~= "timeout" then
      print("Error: " .. msg_or_ip)
    end
  end
  socket.sleep(0.01)
end