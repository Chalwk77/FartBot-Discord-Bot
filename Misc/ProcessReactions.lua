local Reactions = {}

function Reactions:SortReactions(t)
    table.sort(t, function(a, b)
        return a.total > b.total
    end)
    return t
end

function Reactions:WhoFarted()

    local message = self.fart.message
    local results = self.fart.results
    local reactions_cache = message.reactions -- iterable cache of reactions to this message

    coroutine.wrap(function()
        for emoji, v in pairs(reactions_cache) do

            results[emoji] = results[emoji] or { count = 0 }

            -- iterable cache of users who have reacted with this emoji:
            local users = v:getUsers()

            for _, member in pairs(users) do
                if (not member.bot) then
                    -- For every member that used this reaction, add one to count:
                    results[emoji].count = results[emoji].count + 1
                end
            end
        end

        results = self:SortReactions(results)

        for k, v in pairs(results) do
            print(v.offender.name)
            print(k, v.count, v.offender)
        end
    end)()
end

return Reactions