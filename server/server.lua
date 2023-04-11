ESX = exports.es_extended:getSharedObject()

local webhook = '' -- dont forget to set the webhook!
function SendWebHook(webhook, title, description, name, grade)
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        embeds = {{
            ["type"] = "rich",
            ["author"] = {
                ["name"] = name.." - "..grade,
                ["icon_url"] = "https://icons.veryicon.com/png/o/miscellaneous/xdh-font-graphics-library/police-13.png"
            },
            ["title"] = "New incident recorded!",
            ["description"] = "**Title:** \n" ..title.. "\n**Description:** \n" ..description,
            ["color"] = 0x4886e3,
            ["timestamp"] = os.date('!%Y-%m-%dT%H:%M:%S'),
            ["footer"] = {
                ["text"] = "Los Santos Police Department",
                ["icon_url"] = "https://prod.cloud.rockstargames.com/crews/sc/0291/19566919/publish/emblem/emblem_512.png",
            },
            ["thumbnail"] = {
                ["url"] = "https://prod.cloud.rockstargames.com/crews/sc/0291/19566919/publish/emblem/emblem_512.png"
            },
        }}, 
        avatar_url = "https://prod.cloud.rockstargames.com/crews/sc/0291/19566919/publish/emblem/emblem_512.png"
    }), { 
        ['Content-Type'] = 'application/json' 
    })
end


RegisterServerEvent('fusti_incident:sendData')
AddEventHandler('fusti_incident:sendData', function(title, description)
    local xPlayer = ESX.GetPlayerFromId(source)
    local name = xPlayer.getName()
    local job = xPlayer.getJob().name
    local grade = xPlayer.getJob().grade_label
    if job == 'police' then
        SendWebHook(webhook, title, description, name, grade)
    end
end)
