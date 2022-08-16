-- Purge Bot Ban Command file
-- Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

--[[
    This file is part of Purge Bot.

    Purge Bot is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Purge Bot is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with Purge Bot. If not, see <http://www.gnu.org/licenses/>.
]]

local Command = {
    name = 'fart',
    description = 'Make someone fart',
    permission_node = 'administrator',
    help = 'Syntax: /$cmd @user'
}

function Command:Run(args, msg)

    local channel = msg.channel
    local user = args[2] -- target member
    local member = msg.member -- command executor

    if (self:HasPermission(member, msg, self.permission_node)) then

        if (not user) then
            member:send('Invalid user\n' .. self.help)
            return
        end

        local success = pcall(function()
            user = user:gsub('[<@!>]', '')
            user = self.guild:getMember(user)
            return true
        end)

        if (success and user ~= nil) then

            msg:delete()

            local embed = self.on_demand_embed
            embed.description = embed.description:gsub('$name', user.name)
            embed.author = {
                name = user.username,
                icon_url = user.avatarURL,
            }
            channel:send({ embed = embed })

            return true
        end

        member:send('Invalid User ID (or something went wrong)')
    end
end

return Command