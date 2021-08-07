----------------------BY DHZ----------------------
---------------discord.gg/ZKJcrDddYx--------------
----------------------BY DHZ----------------------

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1000)
	end
end)

local checkbosmoteur = false

local checkboxporteavg = false
local checkboxporteavd = false
local checkboxportearg = false
local checkboxporteard = false
local checkboxcapot = false
local checkboxcoffre = false
local checkboxallportes = false

local checkboxporteavgfen = false
local checkboxporteavdfen = false
local checkboxporteargfen = false
local checkboxporteardfen = false
local checkboxallfen = false

local PlayerPed = PlayerPedId()

local MenuBase = ContextUI:CreateMenu(2, "Intéraction véhicule") 
local Centralisation = ContextUI:CreateSubMenu(MenuBase, "Centralisation")
local Fenetres = ContextUI:CreateSubMenu(MenuBase, "Commande centrale")



ContextUI:IsVisible(MenuBase, function(Entity)
    ContextUI:Separator("~b~Plaque", GetVehicleNumberPlateText(GetVehiclePedIsUsing(PlayerPedId())))

    ContextUI:Separator("~y~Niveau d'essence", GetVehicleFuelLevel(GetVehiclePedIsUsing(PlayerPedId())))
    if Config.UtiliserActionMoteur then
        if checkbosmoteur == false then
            ContextUI:Button("~r~Couper~s~ le moteur", nil, function(Selected)
                if (Selected) then
                    SetVehicleEngineOn(GetVehiclePedIsUsing(PlayerPedId()), false, false, true)
                    ESX.ShowNotification('Moteur ~g~coupé')
                    checkbosmoteur = true
                end
            end)
        else
            ContextUI:Button("~g~Allumer~s~ le moteur", nil, function(Selected)
                if (Selected) then
                    SetVehicleEngineOn(GetVehiclePedIsUsing(PlayerPedId()), true, true, true)
                    ESX.ShowNotification('Moteur ~g~allumé')
                    checkbosmoteur = false
                end
            end)
        end
    end

    if Config.Utilisercentralisation then
        ContextUI:Button("~p~Centralisation", nil, function(Selected)
            if (Selected) then
            end
        end,Centralisation)
    end

    if Config.UtiliserCommandeCentrale then
        ContextUI:Button("~o~Système central", nil, function(Selected)
            if (Selected) then
            end
        end,Fenetres)
    end

    if Config.UtiliserReparer then
        ESX.TriggerServerCallback('dhz_carmenu:getUsergroup', function(group)
            playergroup = group
        end)
        if playergroup ~= nil and (playergroup == 'mod' or playergroup == 'admin' or playergroup == 'superadmin' ) then
            ContextUI:Button("Réparer le véhicule", nil, function(Selected)
                if (Selected) then
                    local plyVeh = GetVehiclePedIsIn(PlayerPedId(), false)
                    SetVehicleFixed(plyVeh)
                    SetVehicleDirtLevel(plyVeh, 0.0) 
                end
            end)
        end
    end
end)

ContextUI:IsVisible(Fenetres, function(Entity)
    if checkboxporteavgfen == false then
        ContextUI:Button("~g~Ouvrir~s~ la fenêtre conducteur", nil, function(Selected)
            if (Selected) then
                RollDownWindow(GetVehiclePedIsIn(PlayerPedId(), false),0)
                checkboxporteavgfen = true
            end
        end)
    else
        ContextUI:Button("~r~Fermer~s~ la fenêtre conducteur", nil, function(Selected)
            if (Selected) then
                RollUpWindow(GetVehiclePedIsIn(PlayerPedId(), false),0)
                checkboxporteavgfen = false
            end
        end)
    end

    if checkboxporteavdfen == false then
        ContextUI:Button("~g~Ouvrir~s~ la fenêtre passager", nil, function(Selected)
            if (Selected) then
                RollDownWindow(GetVehiclePedIsIn(PlayerPedId(), false),1)
                checkboxporteavdfen = true
            end
        end)
    else
        ContextUI:Button("~r~Fermer~s~ la fenêtre passager", nil, function(Selected)
            if (Selected) then
                RollUpWindow(GetVehiclePedIsIn(PlayerPedId(), false),1)
                checkboxporteavdfen = false
            end
        end)
    end

    if checkboxporteargfen == false then
        ContextUI:Button("~g~Ouvrir~s~ la fenêtre arrière gauche", nil, function(Selected)
            if (Selected) then
                RollDownWindow(GetVehiclePedIsIn(PlayerPedId(), false),2)
                checkboxporteargfen = true
            end
        end)
    else
        ContextUI:Button("~r~Fermer~s~ la fenêtre arrière gauche", nil, function(Selected)
            if (Selected) then
                RollUpWindow(GetVehiclePedIsIn(PlayerPedId(), false),2)
                checkboxporteargfen = false
            end
        end)
    end

    if checkboxporteardfen == false then
        ContextUI:Button("~g~Ouvrir~s~ la fenêtre arrière droite", nil, function(Selected)
            if (Selected) then
                RollDownWindow(GetVehiclePedIsIn(PlayerPedId(), false),3)
                checkboxporteardfen = true
            end
        end)
    else
        ContextUI:Button("~r~Fermer~s~ la fenêtre arrière droite", nil, function(Selected)
            if (Selected) then
                RollUpWindow(GetVehiclePedIsIn(PlayerPedId(), false),3)
                checkboxporteardfen = false
            end
        end)
    end

    if checkboxallfen == false then
        ContextUI:Button("~g~Ouvrir~s~ toutes les fenêtres", nil, function(Selected)
            if (Selected) then
                RollDownWindow(GetVehiclePedIsIn(PlayerPedId(), false),0)
                RollDownWindow(GetVehiclePedIsIn(PlayerPedId(), false),1)
                RollDownWindow(GetVehiclePedIsIn(PlayerPedId(), false),2)
                RollDownWindow(GetVehiclePedIsIn(PlayerPedId(), false),3)
                checkboxporteavdfen = true
                checkboxporteavgfen = true
                checkboxporteargfen = true
                checkboxporteardfen = true
                checkboxallfen = true
            end
        end)
    else
        ContextUI:Button("~r~Fermer~s~ toutes les fenêtres", nil, function(Selected)
            if (Selected) then
                RollUpWindow(GetVehiclePedIsIn(PlayerPedId(), false),0)
                RollUpWindow(GetVehiclePedIsIn(PlayerPedId(), false),1)
                RollUpWindow(GetVehiclePedIsIn(PlayerPedId(), false),2)
                RollUpWindow(GetVehiclePedIsIn(PlayerPedId(), false),3)
                checkboxporteavdfen = false
                checkboxporteavgfen = false
                checkboxporteargfen = false
                checkboxporteardfen = false
                checkboxallfen = false
            end
        end)
    end
end)


ContextUI:IsVisible(Centralisation, function(Entity)
    if checkboxporteavg == false then
        ContextUI:Button("~g~Ouvrir~s~ la porte conducteur", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), false), 0, false)
                checkboxporteavg = true
            end
        end)
    else
        ContextUI:Button("~r~Fermer~s~ la porte conducteur", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), false), 0, true)
                checkboxporteavg = false
            end
        end)
    end

    if checkboxporteavd == false then
        ContextUI:Button("~g~Ouvrir~s~ la porte passager", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), false), 1, false, false)
                checkboxporteavd = true
            end
        end)
    else
        ContextUI:Button("~r~Fermer~s~ la porte passager", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), false), 1, false, false)
                checkboxporteavd = false
            end
        end)
    end

    if checkboxportearg == false then
        ContextUI:Button("~g~Ouvrir~s~ la porte arrière gauche", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), false), 2, false, false)
                checkboxportearg = true
            end
        end)
    else
        ContextUI:Button("~r~Fermer~s~ la porte arrière gauche", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), false), 2, false, false)
                checkboxportearg = false
            end
        end)
    end

    if checkboxporteard == false then
        ContextUI:Button("~g~Ouvrir~s~ la porte arrière droite", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), false), 3, false, false)
                checkboxporteard = true
            end
        end)
    else
        ContextUI:Button("~r~Fermer~s~ la porte arrière droite", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), false), 3, false, false)
                checkboxporteard = false
            end
        end)
    end

    if checkboxcapot == false then
        ContextUI:Button("~g~Ouvrir~s~ le capôt", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), false), 4, false, false)
                checkboxcapot = true
            end
        end)
    else
        ContextUI:Button("~r~Fermer~s~ le capôt", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), false), 4, false, false)
                checkboxcapot = false
            end
        end)
    end

    if checkboxcoffre == false then
        ContextUI:Button("~g~Ouvrir~s~ le coffre", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), false), 5, false, false)
                checkboxcoffre = true
            end
        end)
    else
        ContextUI:Button("~r~Fermer~s~ le coffre", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), false), 5, false, false)
                checkboxcoffre = false
            end
        end)
    end

    if checkboxallportes == false then
        ContextUI:Button("~g~Ouvrir~s~ toutes les portes", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), false), 0, false, false)
                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), false), 1, false, false)
                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), false), 2, false, false)
                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), false), 3, false, false)
                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), false), 4, false, false)
                SetVehicleDoorOpen(GetVehiclePedIsIn(PlayerPedId(), false), 5, false, false)
                checkboxporteavd = true
                checkboxporteavg = true
                checkboxportearg = true
                checkboxporteard = true
                checkboxcapot = true
                checkboxcoffre = true
                checkboxallportes = true
            end
        end)
    else
        ContextUI:Button("~r~Fermer~s~ toutes les portes", nil, function(Selected)
            if (Selected) then
                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), false), 0, false, false)
                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), false), 1, false, false)
                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), false), 2, false, false)
                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), false), 3, false, false)
                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), false), 4, false, false)
                SetVehicleDoorShut(GetVehiclePedIsIn(PlayerPedId(), false), 5, false, false)
                checkboxporteavd = false
                checkboxporteavg = false
                checkboxportearg = false
                checkboxporteard = false
                checkboxcapot = false
                checkboxcoffre = false
                checkboxallportes = false
            end
        end)
    end
end)

Keys.Register("LMENU", "LMENU", "Menu voiture", function()
    if IsPedSittingInAnyVehicle(PlayerPed) and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == PlayerPedId() then 
        ContextUI.Focus = not ContextUI.Focus;
    end
end)
