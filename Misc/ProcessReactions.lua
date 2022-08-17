local Reactions = {}

function Reactions:SortReactions(t)
    table.sort(t, function(a, b)
        return a.total > b.total
    end)
    return t
end

function Reactions:WhoFarted()

    local message = self.fart
    local reactions_cache = message.reactions -- iterable cache of reactions to this message

    coroutine.wrap(function()

        local results = {}
        for emoji, v in pairs(reactions_cache) do

            local total = v.count
            if (total > 1) then

                results[#results + 1] = { emoji = emoji, total = v.count - 1 } -- exclude bot reaction

                for j = 1, #self.members do
                    local t = self.members[j]
                    if (t.emoji == emoji) then
                        results[#results].member = t.member
                    end
                end
            end
        end

        results = self:SortReactions(results)
        results = results[1]
        local channel = self.random_fart_channel
        local embed = self.the_tribe_has_spoken
        if (results) then

            local role = self.stinky_role
            local member = results.member

            member:addRole(role)
            --member:setNickname("John Doe")

            embed.description = embed.description:gsub('$member', member.name)
            channel:send({ embed = embed })

            self.timer.setTimeout(1000 * 60 * self.stinky_role_duration, function()
                member:removeRole(role)
            end)
        else
            channel:send({ embed = {
                title = 'HUH?',
                description = 'Must have been the wind... 💨'
            } })
        end
    end)()
end

return Reactions