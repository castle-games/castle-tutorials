local x, y = 0, 0
local shipRadius = 40
local shipImage = love.graphics.newImage('ship.png')
local itemImage = love.graphics.newImage('item.png')

local itemsCollected = 0

local items = {}
local NUM_ITEMS = 5
for index = 1, NUM_ITEMS, 1 do
   local item = {
      x = math.random(10, 800),
      y = math.random(10, 400),
      radius = 10
   }
   table.insert(items, item)
end

local function drawItems()
   love.graphics.setColor(1, 1, 1)
   for index, item in pairs(items) do
      love.graphics.draw(itemImage, item.x - item.radius, item.y - item.radius)
   end
end

local function distance(x1, y1, x2, y2)
   local dx, dy = x2 - x1, y2 - y1
   return math.sqrt(dx * dx + dy * dy)
end

function love.draw()
   drawItems()
   
   love.graphics.setColor(1, 1, 1)
   love.graphics.draw(shipImage, x - shipRadius, y - shipRadius)

   love.graphics.setColor(0, 1, 1)
   love.graphics.print('items collected: ' .. itemsCollected, 8, 8)
end

function love.update(dt)
   if love.keyboard.isDown('left') then
      x = x - 240 * dt
   end
   if love.keyboard.isDown('right') then
      x = x + 240 * dt
   end
   if love.keyboard.isDown('up') then
      y = y - 240 * dt
   end
   if love.keyboard.isDown('down') then
      y = y + 240 * dt
   end

   for index, item in pairs(items) do
      local distanceToItem = distance(x, y, item.x, item.y)
      if distanceToItem < shipRadius + item.radius then
         items[index] = nil
         itemsCollected = itemsCollected + 1
      end
   end
end
