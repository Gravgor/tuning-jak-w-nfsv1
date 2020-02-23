addEvent("turbo:normal", true)
addEventHandler("turbo:normal", root, function()
    local veh = getPedOccupiedVehicle(client)
      if veh then 
        setVehicleHandling(veh, "maxVelocity", 187)
        outputChatBox("* Zamontowałeś turbo!", client, 255, 255, 255)
      end 
    end)

    addEvent("turbo:PrototypePacket", true)
addEventHandler("turbo:PrototypePacket", root, function()
    local veh = getPedOccupiedVehicle(client)
      if veh then 
        setVehicleHandling(veh, "maxVelocity", 195)
        outputChatBox("* Zamontowałeś turbo!", client, 255, 255, 255)
      end 
    end)

    addEvent("turbo:RacePacket", true)
addEventHandler("turbo:RacePacket", root, function()
    local veh = getPedOccupiedVehicle(client)
      if veh then 
        setVehicleHandling(veh, "maxVelocity", 203)
        outputChatBox("* Zamontowałeś turbo!", client, 255, 255, 255)
      end 
    end)

    addEvent("brakes:normalBrakes", true)
addEventHandler("brakes:normalBrakes", root, function()
    local veh = getPedOccupiedVehicle(client)
      if veh then 
        setVehicleHandling(veh, "brakeDeceleration", 35.0)
        outputChatBox("* Zamontowałeś turbo!", client, 255, 255, 255)
      end 
    end)

    addEvent("brakes:prototypeBrakes", true)
addEventHandler("brakes:prototypeBrakes", root, function()
    local veh = getPedOccupiedVehicle(client)
      if veh then 
        setVehicleHandling(veh, "brakeDeceleration", 45.0)
        outputChatBox("* Zamontowałeś turbo!", client, 255, 255, 255)
      end 
    end)

    addEvent("brakes:raceBrakes", true)
    addEventHandler("brakes:raceBrakes", root, function()
        local veh = getPedOccupiedVehicle(client)
          if veh then 
            setVehicleHandling(veh, "brakeDeceleration", 65.0)
            outputChatBox("* Zamontowałeś turbo!", client, 255, 255, 255)
          end 
        end)

        addEvent("packet:normalPacket", true)
addEventHandler("packet:normalPacket", root, function()
    local veh = getPedOccupiedVehicle(client)
      if veh then 
        setVehicleHandling(veh, "maxVelocity", 185)
        outputChatBox("* Zamontowałeś turbo!", client, 255, 255, 255)
      end 
    end)

    addEvent("packet:prototype", true)
addEventHandler("packet:prototype", root, function()
    local veh = getPedOccupiedVehicle(client)
      if veh then 
        setVehicleHandling(veh, "maxVelocity", 190)
        outputChatBox("* Zamontowałeś turbo!", client, 255, 255, 255)
      end 
    end)

    addEvent("packet:RacePacket", true)
addEventHandler("packet:RacePacket", root, function()
    local veh = getPedOccupiedVehicle(client)
      if veh then 
        setVehicleHandling(veh, "maxVelocity", 200)
        outputChatBox("* Zamontowałeś turbo!", client, 255, 255, 255)
      end 
    end)