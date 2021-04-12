local socket = require("socket")

local udp = socket.udp()

print("Starting UDP demo-server on port 12345")

udp:setsockname('*', 12345)
udp:settimeout(0)

local running = true
while running do
  local data, msg_or_ip, port_or_nil = udp:receivefrom()
  if data then
    -- log and echo requests
    print(msg_or_ip .. " : " .. data)
    udp:sendto(data, msg_or_ip, port_or_nil)
  else
    print(os.date("%x %X Error: " .. msg_or_ip))
  end
  socket.sleep(0.01)
end