-- Fart Bot settings file
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

return {

    -- =================================================--
    -- CONFIGURATION STARTS ...

    --------------------------------------
    -- DISCORD SERVER ID --
    -- Paste your Discord server numerical ID (NOT NAME):
    -- 1). Right click the Discord server icon and click "Copy ID".
    -- 2). Replace "xxxxxxxxxxxxxxxxxx" below with the id you copied.
    discord_server_id = '508458848559038465',

    -- Commands files:
    -- Set to false to disable command.
    --
    -- The command name itself can be edited in "/WordBuster/Commands/<file name>".
    -- Look for the name property.
    --
    commands = {
        ['fart'] = true,
    },


    -- Command prefix:
    --
    prefix = "/",


    -- A random fart will occur randomly between the min/max seconds:
    --
    random_fart = { 3600, 86400 },


    -- Time to react (in seconds):
    --
    time_to_vote = 3,


    -- Numerical channel id where fart messages will appear:
    --
    random_fart_channel = '1008843928235151420',


    -- Numerical id of the custom role to be given:
    --
    stinky_role = '1008968988228866049',


    -- Time (in minutes) that someone will have the "stinky" role:
    --
    stinky_role_duration = 30,


    -- Temporary nickname appended to the offender's name:
    --
    smelly_nickname = 'Smelly',


    -- List of member participant numerical ids:
    --
    members = {
        --'261746438512443392', -- 8953draculA
        '71815575856226304', -- Azaron
        --'681519206675513380', -- BlueStar
        '427530181092048897', -- Chalwk
        --'359074672697933835', -- chicanery
        --'120272014647754752', -- dariusofwest
        --'880688167408246815', -- EamonCavaney
        --'296803809596932096', -- Ein
        --'556830182975995944', -- Goldeneye
        '684490463016779827', -- Hitman
        --'809961773431652413', -- kay
        --'649086093140164627', -- Kitty_Murder_Mittens
        --'602404004743479307', -- Na$ty_$uicide
        --'424726217762275328', -- o0starmazing0o
        --'669164915084361729', -- Rose
        --'676113748708294659', -- sandra~
        --'219994062743142403', -- soskyhi
        --'983091653260738571', -- UssyGussy
        '226823765240053760', -- §hôö
        --'376085453285228544', -- §ïÐëWä®ÐW40
        --'303215854307246080', -- Đöťś
        '302593413658705922', -- EldarSquirl
    },


    -- Embed message that appears automatically:
    --
    who_farted_embed = {
        title = "💨 FRAAAP 💨",
        color = 0xc27c0e, -- dark gold
        fields = {
            {
                name = "💩 Poo! 💩",
                value = "Vote for the stinky offender...",
                inline = true
            },
            {
                name = "Members:",
                value = '$list',
                inline = false
            },
        },
        image = {
            url = 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/4d87b0f4-ae26-4b18-835c-af3a7ce1349f/dcaryjn-0fe92d98-ee39-4592-9c58-efa86f683f9e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzRkODdiMGY0LWFlMjYtNGIxOC04MzVjLWFmM2E3Y2UxMzQ5ZlwvZGNhcnlqbi0wZmU5MmQ5OC1lZTM5LTQ1OTItOWM1OC1lZmE4NmY2ODNmOWUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.2hGAukF0Misytk3k-Yw09ZUQ-aKxGFy_JfpKGNKmbio'
        },
        footer = {
            text = "REACT TO SHAME SOMEONE"
        }
    },


    -- EDITED version of "who_farted_embed" (appears after reactions are calculated):
    --
    edited_who_farted_embed = {
        color = 0xc27c0e, -- dark gold
        title = "💨 FRAAAP 💨",
        image = {
            url = 'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/4d87b0f4-ae26-4b18-835c-af3a7ce1349f/dcaryjn-0fe92d98-ee39-4592-9c58-efa86f683f9e.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzRkODdiMGY0LWFlMjYtNGIxOC04MzVjLWFmM2E3Y2UxMzQ5ZlwvZGNhcnlqbi0wZmU5MmQ5OC1lZTM5LTQ1OTItOWM1OC1lZmE4NmY2ODNmOWUucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.2hGAukF0Misytk3k-Yw09ZUQ-aKxGFy_JfpKGNKmbio'
        }
    },

    -- Embed message that appears when using /fart command:
    --
    on_demand_embed = {
        title = '💨 FRAAAP 💨',
        description = '**$name farted!**',
        image = {
            url = 'https://i.pinimg.com/564x/1d/68/86/1d68860e98ac4178b11d5cef0d07fc4b.jpg'
        }
    },


    -- Embed message that appears after reactions have been calculated:
    --
    the_tribe_has_spoken = {
        title = '🗳️ THE TRIBE HAS SPOKEN 🗳️',
        description = '$member has been blamed for farting! He/She gets a smelly role and title.'
    },



    -- Table of reaction emoji's:
    --
    reaction_emoji = {
        '1️⃣',
        '2️⃣',
        '3️⃣',
        '4️⃣',
        '5️⃣',
        '6️⃣',
        '7️⃣',
        '8️⃣',
        '9️⃣',
    },


    -- [!] do not touch --
    token = function()
        local token = ''
        local file = io.open('./auth.data')
        if (file) then
            token = file:read()
            file:close()
        end
        return token
    end
}