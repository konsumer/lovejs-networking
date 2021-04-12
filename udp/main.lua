local socket = require("socket")

local address, port = "localhost", 12345
local updaterate = 2 -- how long to wait, in seconds, before requesting an update

local t = 0
local requesting = false
local error = nil
local data = nil

-- center of screen for text, vertically
local vert_center = (love.graphics.getHeight() / 2) - 6

function love.load()
  udp = socket.udp()
  -- they say to use 0, but that causes constant timeouts
  udp:settimeout(1)
  udp:setpeername(address, port)
end

function love.update(dt)
  t = t + dt
  requesting = t > updaterate
  if requesting then
    udp:send("hi from UDP demo: " .. os.time())
    data, error = udp:receive()
    t=t-updaterate -- set t for the next round
  end
end

function love.draw()
  love.graphics.setColor( 1, 1, 1, 1 )
  if requesting then
    love.graphics.printf("!", 0, 0, love.graphics.getWidth(), "right")
  else
    love.graphics.printf("...", 0, 0, love.graphics.getWidth(), "right")
  end
  if data then
    love.graphics.setColor( 0, 1, 0, 1 )
    love.graphics.printf(data, 0, vert_center, love.graphics.getWidth(), "center")
  end
  if error then
    love.graphics.setColor( 1, 0, 0, 1 )
    love.graphics.printf(error, 0, vert_center, love.graphics.getWidth(), "center")
  end
end
