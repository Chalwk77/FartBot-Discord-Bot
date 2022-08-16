-- Fart Bot PermCheck file
-- Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

--[[
    This file is part of Fart Bot.

    Fart Bot is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Fart Bot is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with Fart Bot. If not, see <http://www.gnu.org/licenses/>.
]]

local Member = {}

function Member:HasPermission(member, msg, node)
    if (not member:hasPermission(node)) then
        msg:delete()
        member:send {
            embed = {
                title = 'Perms Error',
                description = 'You need "' .. node .. '" perm to use this command.',
                color = 0x000000
            }
        }
        return false
    end
    return true
end

return Member