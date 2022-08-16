-- Fart Bot Entry point file
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


local Discord = {
    fart = {},
    commands = {},
    timer = require('timer'),
    dependencies = {
        ['./'] = { 'settings' },
        ['./Events/'] = {
            'OnMessage',
            'OnTick',
        },
        ['./Misc/'] = {
            'PermCheck',
            'RandomFart',
            'ProcessReactions',
        }
    }
}

local Discordia = require('discordia')
local client = Discordia.Client()

setmetatable(Discord, {
    __index = client
})

function Discord:LoadDependencies()
    local s = self
    for path, t in pairs(self.dependencies) do
        for _, file in pairs(t) do
            local f = loadfile(path .. file .. '.lua')()
            setmetatable(s, { __index = f })
            s = f
        end
    end
end

function Discord:LoadCommands()
    local path = './Commands/'
    for file, enabled in pairs({
        ['fart'] = true,
    }) do
        if (enabled) then
            local command = require(path .. file)
            local cmd = command.name
            self.commands[cmd] = command
            self.commands[cmd].help = command.help:gsub('$cmd', cmd)
            setmetatable(self.commands[cmd], { __index = self })
        end
    end
end

function Discord:OnReady()
    self.guild = client:getGuild(self.discord_server_id)
    if (self.guild) then

        self.client = client

        client:info('Ready: ' .. client.user.tag .. ' | Bot version: 1.0')

        self:LoadCommands()

        self.random_fart_channel = self.guild:getChannel(self.random_fart_channel)

        -- @param v = numerical member id (string)
        -- @param k = table index
        for k, v in ipairs(self.members) do
            self.members[k] = {
                emoji = self.reaction_emoji[k],
                member = self.guild:getMember(v) -- member cache
            }
        end

        self:OnTick()
    end
end

function Discord:StartBot()
    self:LoadDependencies()

    client:run('Bot ' .. self.token())
    client:setGame("💨 FRAAAP 💨")
end

Discord:on('ready', function()
    Discord:OnReady()
end)

Discord:on('messageCreate', function(msg)
    Discord:OnMessage(msg)
end)

Discord:StartBot()