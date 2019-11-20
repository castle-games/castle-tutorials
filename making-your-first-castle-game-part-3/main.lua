local x, y = 0, 0
local shipRadius = 18
local shipImage = love.graphics.newImage('ship.png')
local itemImage = love.graphics.newImage('item.png')
local enemyImage = love.graphics.newImage('enemy.png')

local itemsCollected = 0
local screenWidth, screenHeight = 800, 450

local items = {}
local enemies = {}
local gameState

local function resetGame()
   gameState = 'playing'
   x, y = 0, 0
   itemsCollected = 0
   
   items = {}
   local NUM_ITEMS = 5
   for index = 1, NUM_ITEMS, 1 do
      local item = {
         x = math.random(10, screenWidth),
         y = math.random(10, screenHeight),
         radius = 10
      }
      table.insert(items, item)
   end

   enemies = {}
   for index = 1, 5, 1 do
      local enemy = {
         x = math.random(10, screenWidth),
         y = math.random(10, screenHeight),
         vx = math.random(-2, 2) * 60,
         vy = math.random(-2, 2) * 60,
         radius = 10,
      }
      table.insert(enemies, enemy)
   end
end

local function drawEnemies()
   love.graphics.setColor(1, 1, 1)
   for index, enemy in pairs(enemies) do
      love.graphics.draw(enemyImage, enemy.x - enemy.radius, enemy.y - enemy.radius)
   end
end

local function drawItems()
   love.graphics.setColor(1, 1, 1)
   for index, item in pairs(items) do
      love.graphics.draw(itemImage, item.x - item.radius, item.y - item.radius)
   end
end

local function updateEnemies(dt)
   for index, enemy in pairs(enemies) do
      enemy.x = enemy.x + enemy.vx * dt
      enemy.y = enemy.y + enemy.vy * dt
      if enemy.x < -enemy.radius then
         enemy.x = screenWidth + enemy.radius
      elseif enemy.x > screenWidth + enemy.radius then
         enemy.x = -enemy.radius
      end
      if enemy.y < -enemy.radius then
         enemy.y = screenHeight + enemy.radius
      elseif enemy.y > screenHeight + enemy.radius then
         enemy.y = -enemy.radius
      end
   end
end

local function distance(x1, y1, x2, y2)
   local dx, dy = x2 - x1, y2 - y1
   return math.sqrt(dx * dx + dy * dy)
end

function love.load()
   resetGame()
end

function love.draw()
   if gameState == 'over' then
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.print('game over', 128, 128)
      love.graphics.print('press return to try again', 128, 140)
   else
      drawItems()
      drawEnemies()

      love.graphics.setColor(1, 1, 1)
      love.graphics.draw(shipImage, x - shipRadius, y - shipRadius)

      love.graphics.setColor(0, 1, 1)
      love.graphics.print('items collected: ' .. itemsCollected, 8, 8)
   end
end

function love.update(dt)
   if gameState == 'over' then
      if love.keyboard.isDown('return') then
         resetGame()
      end
   else
      updateEnemies(dt)

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

      for index, enemy in pairs(enemies) do
         local distanceToEnemy = distance(x, y, enemy.x, enemy.y)
         if distanceToEnemy < shipRadius + enemy.radius then
            -- game over
            gameState = 'over'
         end
      end

      for index, item in pairs(items) do
         local distanceToItem = distance(x, y, item.x, item.y)
         if distanceToItem < shipRadius + item.radius then
            items[index] = nil
            itemsCollected = itemsCollected + 1
         end
      end
   end
end
