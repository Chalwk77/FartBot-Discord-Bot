local Fart = {}

function Fart:Toot()

    -- format member list for embed message:
    local des = ''
    for _, v in ipairs(self.members) do
        if (v.member) then
            --v.real_nickname = v.member.nickname
            des = des .. v.member.name .. ': ' .. v.emoji .. '\n'
        end
    end

    local channel = self.random_fart_channel
    local embed = self.who_farted_embed
    embed.fields[2].value = embed.fields[2].value:gsub('$list', des)

    -- create embed:
    local msg_object = channel:send({ embed = embed })
    if (msg_object) then

        -- add reactions:
        for _, v in ipairs(self.members) do
            msg_object:addReaction(v.emoji)
        end

        self.fart = msg_object -- set after reactions are added (important)

        -- Init vote timer:
        self.timer.setTimeout(1000 * self.time_to_vote, function()
            self:WhoFarted()
        end)
    end
end

return Fart