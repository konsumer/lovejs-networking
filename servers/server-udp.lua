local socket = require("socket")

local udp = socket.udp()

-- they say to use 0, but that causes constant timeouts
udp:settimeout(1)
udp:setsockname('*', 12345)

local running = true
while running do
  local data, msg_or_ip, port_or_nil = udp:receivefrom()
  if data then
    print(msg_or_ip .. " : " .. data)
  else
    print("Errror: " .. msg_or_ip)
  end
  socket.sleep(0.01)
end