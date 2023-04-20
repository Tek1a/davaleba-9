Player = Class{}

function Player:init(x,y, width, height)
    self.x = x 
    self.y = y 
    self.width = width
    self.height = height
end

function Player:render() 
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end
