-- Fart Bot OnMessage file
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

local Message = {}

local function CmdSplit(s)
    local args = {}
    for arg in s:gmatch('([^%s]+)') do
        args[#args + 1] = arg
    end
    return args
end

function Message:OnMessage(msg)

    local author = msg.author
    local member = msg.member
    local content = msg.content

    local args = CmdSplit(content)

    if (not author or author.bot) then
        return
    elseif (#args > 0 and args[1]:sub(1, 1) == self.prefix) then

        local success, err = pcall(function()
            args[1] = args[1]:gsub(self.prefix, '')
            if (self.commands[args[1]]) then
                self.commands[args[1]]:Run(args, msg)
            end
        end)

        if (not success) then
            self:warning(err)
            member:send('Something went wrong, please try again later')
        end
    end
end

return Message