--██████╗░░█████╗░██████╗░░█████╗░██╗░░██╗░█████╗░███╗░░██╗░██████╗░███████╗███╗░░██╗
--██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔══██╗████╗░██║██╔════╝░██╔════╝████╗░██║
--██████╔╝███████║██████╔╝███████║█████═╝░██║░░██║██╔██╗██║██║░░██╗░█████╗░░██╔██╗██║
--██╔═══╝░██╔══██║██╔═══╝░██╔══██║██╔═██╗░██║░░██║██║╚████║██║░░╚██╗██╔══╝░░██║╚████║
--██║░░░░░██║░░██║██║░░░░░██║░░██║██║░╚██╗╚█████╔╝██║░╚███║╚██████╔╝███████╗██║░╚███║
--╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝░╚═════╝░╚══════╝╚═╝░░╚══╝

local player = PlayerPedId()

Citizen.CreateThread(function()
    while true do 
      Citizen.Wait(0) 
      if GetDistanceBetweenCoords(461.56903076172,-983.08697509766,29.68931388855, GetEntityCoords(GetPlayerPed(-1))) < 1.0 then
        DrawMarker(27, 461.56903076172,-983.08697509766,29.68931388855+1 - 1, 0, 0, 0, 0, 0, 0, 0.250, 0.250, 0.250, 100, 500, 2, 500, 0, 1, 0, 5)
           DrawText3Ds( 461.56903076172,-983.08697509766,29.68931388855, "Tryk ~g~E~s~ For at få attachments på dine våben")
           if IsControlJustPressed(1, 38) then
            TriggerServerEvent("papapoliti:permission")
           end
        end
    end
end)

RegisterNetEvent('papapoliti:tag')
AddEventHandler('papapoliti:tag', function()
    FreezeEntityPosition(PlayerPedId(), true) 
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 0, true)
    local finished = exports["progressBars"]:startUI (4500, "Finder attachments")
    Citizen.Wait(4500) 
    ClearPedTasksImmediately(GetPlayerPed(-1))
    FreezeEntityPosition(PlayerPedId(), false)
    
    --HEAVY PISTOL
    GiveWeaponComponentToPed(PlayerPedId(), 0xD205520E, 'COMPONENT_HEAVYPISTOL_CLIP_02')
    GiveWeaponComponentToPed(PlayerPedId(), 0xD205520E, 'COMPONENT_AT_PI_FLSH')
    GiveWeaponComponentToPed(PlayerPedId(), 0xD205520E, 'COMPONENT_AT_PI_SUPP')
   --COMBATPISTOL
    GiveWeaponComponentToPed(PlayerPedId(), 0x5EF9FEC4, 'COMPONENT_COMBATPISTOL_CLIP_02')
    GiveWeaponComponentToPed(PlayerPedId(), 0x5EF9FEC4, 'COMPONENT_AT_PI_FLSH')
    GiveWeaponComponentToPed(PlayerPedId(), 0x5EF9FEC4, 'COMPONENT_AT_PI_SUPP')
    --MP5
    GiveWeaponComponentToPed(PlayerPedId(), 0x2BE6766B, 'COMPONENT_ASSAULTSMG_CLIP_02')
    GiveWeaponComponentToPed(PlayerPedId(), 0x2BE6766B, 'COMPONENT_AT_AR_SUPP_02')
    GiveWeaponComponentToPed(PlayerPedId(), 0x2BE6766B, 'COMPONENT_AT_SCOPE_MACRO')
    GiveWeaponComponentToPed(PlayerPedId(), 0x2BE6766B, 'COMPONENT_AT_AR_FLSH')
    GiveWeaponComponentToPed(PlayerPedId(), 0x2BE6766B, 'COMPONENT_AT_AR_SUPP_02')
    --pistol
    GiveWeaponComponentToPed(PlayerPedId(), 0x1B06D571, 'COMPONENT_PISTOL_CLIP_02')
    GiveWeaponComponentToPed(PlayerPedId(), 0x1B06D571, 'COMPONENT_AT_PI_FLSH')
    GiveWeaponComponentToPed(PlayerPedId(), 0x1B06D571, 'COMPONENT_AT_AR_SUPP_02')

    
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

--██████╗░░█████╗░██████╗░░█████╗░██╗░░██╗░█████╗░███╗░░██╗░██████╗░███████╗███╗░░██╗
--██╔══██╗██╔══██╗██╔══██╗██╔══██╗██║░██╔╝██╔══██╗████╗░██║██╔════╝░██╔════╝████╗░██║
--██████╔╝███████║██████╔╝███████║█████═╝░██║░░██║██╔██╗██║██║░░██╗░█████╗░░██╔██╗██║
--██╔═══╝░██╔══██║██╔═══╝░██╔══██║██╔═██╗░██║░░██║██║╚████║██║░░╚██╗██╔══╝░░██║╚████║
--██║░░░░░██║░░██║██║░░░░░██║░░██║██║░╚██╗╚█████╔╝██║░╚███║╚██████╔╝███████╗██║░╚███║
--╚═╝░░░░░╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝╚═╝░░╚═╝░╚════╝░╚═╝░░╚══╝░╚═════╝░╚══════╝╚═╝░░╚══╝