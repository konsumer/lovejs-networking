local socket = require("socket")

local updaterate = 4 -- how long to wait, in seconds, before requesting an update

local t = 0
local requesting = false
local error = nil
local data = "Please wait..."

-- center of screen for text, vertically
local vert_center = (love.graphics.getHeight() / 2) - 6

-- say hi and wait for echo
function sayhi()
  print("Requesting")
  udp:send("hi from UDP demo: " .. os.time())
  data, error = udp:receive()
end


function love.load()
  udp = socket.udp()
  udp:settimeout(1)
  udp:setpeername('127.0.0.1', 12345)
  sayhi()
end

function love.update(dt)
  t = t + dt
  requesting = t > updaterate
  if requesting then
    sayhi()
    t=t-updaterate -- set t for the next round
  end
end

function love.draw()
  love.graphics.setColor( 1, 1, 1, 1 )
  if requesting then
    love.graphics.printf("...", 0, 2, love.graphics.getWidth()-2, "right")
  else
    love.graphics.printf("!", 0, 2, love.graphics.getWidth()-2, "right")
  end
  if data then
    love.graphics.setColor( 0, 1, 0, 1 )
    love.graphics.printf(data, 0, vert_center, love.graphics.getWidth()-2, "center")
  end
  if error then
    love.graphics.setColor( 1, 0, 0, 1 )
    love.graphics.printf(error, 0, vert_center, love.graphics.getWidth()-2, "center")
  end
end
