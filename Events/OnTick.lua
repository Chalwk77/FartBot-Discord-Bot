local Timer = {}

function Timer:OnTick()

    local min = self.random_fart[1]
    local max = self.random_fart[2]

    local n = math.random(min, max)
    self:Toot()

    self.timer.setTimeout(1000 * n, function()
        self:OnTick()
    end)
end

return Timer