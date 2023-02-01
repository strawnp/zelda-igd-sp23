Projectile = Class{__includes = GameObject}

function Projectile:init(room, object)
	self.room = room
	self.projectile = object
	self.player = room.player
    self.direction = self.player.direction
end

function Projectile:update(dt)
	local direction = self.player.direction

    if direction == "up" then
        self.projectile.y = self.projectile.y - 1
    elseif direction == "down" then
        self.projectile.y = self.projectile.y + 1
    elseif direction == "left" then
        self.projectile.x = self.projectile.x - 1
    elseif direction == "right" then
        self.projectile.x = self.projectile.x + 1
    end

    self:checkWallCollision()
    self:checkEntityCollision()

    print(dt)
end


function Projectile:checkWallCollision()

    if self.direction == 'left' then
        if self.projectile.x <= MAP_RENDER_OFFSET_X + TILE_SIZE then
            self.projectile.state = "broken"
        end
    elseif self.direction == 'right' then
        if self.projectile.x + self.projectile.width >= VIRTUAL_WIDTH - TILE_SIZE * 2 then
            self.projectile.state = "broken"
        end
    elseif self.direction == 'up' then
        if self.projectile.y <= MAP_RENDER_OFFSET_Y + TILE_SIZE - self.projectile.height / 2 then
            self.projectile.state = "broken"
        end
    elseif self.direction == 'down' then
        local bottomEdge = VIRTUAL_HEIGHT - (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE)
            + MAP_RENDER_OFFSET_Y - TILE_SIZE

        if self.projectile.y + self.projectile.height >= bottomEdge then
            self.projectile.state = "broken"
        end
    end
end

function Projectile:checkEntityCollision()
	for i = #self.room.entities, 1, -1 do
        local entity = self.room.entities[i]
        if entity:collides(self.projectile) then
            self.projectile.state = "broken"
            entity:damage(1)
            entity.onCollide(entity)
            gSounds['hit-enemy']:play()
        end

    end
end
