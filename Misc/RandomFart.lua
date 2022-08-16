local Fart = {}

function Fart:Toot()

    -- format member list for embed message:
    local des = ''
    for _, v in ipairs(self.members) do
        if (v.member) then
            des = des .. v.member.name .. ': ' .. v.emoji .. '\n'
        end
    end

    local channel = self.random_fart_channel
    local embed = self.auto_embed

    -- create embed:
    embed.fields[2].name = embed.fields[2].name:gsub('$list', des)
    local msg_object = channel:send({ embed = embed })

    -- add reactions:
    for _, v in ipairs(self.members) do
        msg_object:addReaction(v.emoji)
    end

    self.fart = { message = msg_object, results = {} }

    -- Init vote timer:
    self.timer.setTimeout(1000 * self.time_to_vote, function()
        self:WhoFarted()
    end)
end

return Fart