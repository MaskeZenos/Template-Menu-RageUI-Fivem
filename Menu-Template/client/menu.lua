
-------------------------Declare ESX-------------------------
ESX = nil
CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(1000)
    end
end)

-------------------------Menu--------------------------------
open = false
local mainMenu = RageUI.CreateMenu(TemplateMenu.NomduMenu, "Interaction")
mainMenu.Closed = function() 
    open = false 
end

local function openMenuCoords()
    if open then 
        open = false 
        RageUI.Visible(mainMenu, false)
        return 
    else
        open = true 
        RageUI.Visible(mainMenu, true)
        CreateThread(function()
            while open do 
                local coords = GetEntityCoords(PlayerPedId())               
                RageUI.IsVisible(mainMenu, function()
                    RageUI.Button("Button_name", nil, {}, menuouverte, {
                        onSelected = function()
                            --Event
                        end
                    })
                    RageUI.Button("Button_name", nil, {}, arrete, {
                        onSelected = function()
                            --Event
                        end
                    })
                end)
                Wait(0)
            end
        end)
    end
end

-------------------------Commande-----------------------------
RegisterCommand(TemplateMenu.Nomdelacommande, function()
    openMenuCoords()
end, false)
