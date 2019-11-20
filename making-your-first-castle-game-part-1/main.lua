local x, y = 40, 40

local shipImage = love.graphics.newImage('ship.png')

function love.draw()
   love.graphics.setColor(1, 1, 1)
   love.graphics.draw(shipImage, x, y)
end

function love.update(dt)
   if love.keyboard.isDown('left') then
      x = x - 120 * dt
   end
   if love.keyboard.isDown('right') then
      x = x + 120 * dt
   end
   if love.keyboard.isDown('up') then
      y = y - 120 * dt
   end
   if love.keyboard.isDown('down') then
      y = y + 120 * dt
   end
end
