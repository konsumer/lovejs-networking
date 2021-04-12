local socket = require("socket")

print("Starting TCP demo-server on port 12345")

local tcp = socket.bind('127.0.0.1', 12345)

local running = true
while running do
  local client = tcp:accept()
  client:settimeout(2)
  local data, err = client:receive()
  if data then
    print("OK: " .. data)
    client:send(data .. "\n")
  else
    print("Error: " .. err)
  end
  client:close()
  socket.sleep(0.01)
end