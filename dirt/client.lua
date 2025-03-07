RegisterCommand("clean", function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        SetVehicleDirtLevel(vehicle, 0.0)

        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"Me", "Your vehicle has been cleaned!"}
        })
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"Me", "You are not in a vehicle!"}
        })
    end
end, false)

RegisterCommand("dirt", function(source, args, rawCommand)
    local playerPed = PlayerPedId()
    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        local dirtLevel = tonumber(args[1])

        if dirtLevel and dirtLevel >= 0 and dirtLevel <= 15 then
            SetVehicleDirtLevel(vehicle, dirtLevel + 0.0)

            Citizen.Wait(100)
            local actualDirtLevel = GetVehicleDirtLevel(vehicle)

            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0 },
                multiline = true,
                args = {"Me", "Dirt level set to " .. actualDirtLevel}
            })
        else
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0 },
                multiline = true,
                args = {"Me", "Invalid dirt level. Use a number between 0 and 15."}
            })
        end
    else
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0 },
            multiline = true,
            args = {"Me", "You are not in a vehicle!"}
        })
    end
end, false)

