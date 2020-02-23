--[[
    Autor głównego kodu: Gravgor
    Pomysły: Query
    Podsyłanie zapomnianych funkcji: Query
]]


function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
    local sx, sy = guiGetScreenSize ( )
    local cx, cy = getCursorPosition ( )
    local cx, cy = ( cx * sx ), ( cy * sy )
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then
        return true
    else
        return false
    end
end

--- useful powyzej 
    local totalcost = 0 -- wszystko darmowe, ceny trzeba juz sobie dodac ;)

   --[[function sprawdzModel()
    local veh ]]

function onPlayerEnterRender()
    dxDrawRectangle(114, 606, 296, 52, tocolor(7, 6, 6, 185), false)
    dxDrawText("Total cost: "..totalcost, 119, 611, 261, 629, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
    dxDrawText("Cash: "..getPlayerMoney(localPlayer), 119, 635, 261, 653, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
    dxDrawRectangle(349, 129, 853, 52, tocolor(7, 6, 6, 185), false)
    dxDrawText("Performance", 349, 71, 556, 123, tocolor(255, 255, 255, 255), 3.00, "sans", "left", "top", false, false, false, false, false)
    dxDrawText("Turbo", 459, 139, 556, 168, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "top", false, false, false, false, false)
    dxDrawText("Brakes", 710, 139, 807, 168, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "top", false, false, false, false, false)
    dxDrawText("Packages", 1009, 139, 1106, 168, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "top", false, false, false, false, false)
    dxDrawRectangle(1068, 604, 296, 70, tocolor(7, 6, 6, 185), false)
    dxDrawText("CAR: ", 1081, 613, 1195, 645, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("MAX SPEED  km/h", 1081, 635, 1195, 667, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)
end 

local buttony = {
    turbo = guiCreateButton(440, 129, 136, 49, "", false),
    brakes = guiCreateButton(696, 129, 136, 49, "", false),
    packages = guiCreateButton(1003, 132, 136, 49, "", false),
} --- hehe wiem, fajny skrypt ale to dla tych wszystkich kochanych pseudoli, żeby łatwo zmienić <3


guiSetVisible(buttony.turbo, false)
guiSetAlpha(buttony.turbo, 0.00)
guiSetVisible(buttony.brakes, false)
guiSetAlpha(buttony.brakes, 0.00)
guiSetVisible(buttony.packages, false)
guiSetAlpha(buttony.packages, 0.00)
--interior 1 -2047.31433, 176.43933, 28.83594

local markerW = createMarker(-1905.66260, 270.68561, 40.44888, "cylinder", 4.0, 255, 255, 255)

function onPlayerEnterVeh()
    local veh = getPedOccupiedVehicle(localPlayer)
      if veh then 
        --setElementPosition(localPlayer, -2047.31433, 176.43933, 28.83594)
        setElementInterior(localPlayer, 1)
        setElementPosition(veh, -2047.31433, 176.43933, 28.83594)
        setElementInterior(veh, 1)
        --warpPedIntoVehicle(localPlayer, veh)
        setCameraMatrix(-2040.81726, 180.20132, 28.83879, -2046.71436, 177.29001, 28.83594)
        setElementFrozen(localPlayer, true)
       -- setElementFrozen(veh, true)
        guiSetVisible(buttony.turbo, true)
        guiSetVisible(buttony.brakes, true)
        guiSetVisible(buttony.packages, true) 
        setPlayerHudComponentVisible("all", false)
        setVehicleEngineState(veh, false)
        showCursor(true)
        addEventHandler("onClientRender", root, onPlayerEnterRender)
      end 
    end 
    addEventHandler("onClientMarkerHit", markerW, onPlayerEnterVeh)

    zmiennaTurbo = false 
    function turbo()
        dxDrawRectangle(349, 181, 252, 320, tocolor(26, 26, 26, 175), false)
        dxDrawText(getElementData(localPlayer, "turbo:normal") or "Normal (0$)", 426, 191, 591, 240, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "top", false, false, false, false, false)
        dxDrawText(getElementData(localPlayer, "turbo:PrototypePacket") or "Prototype (0$)", 426, 276, 591, 325, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "top", false, false, false, false, false)
        dxDrawText(getElementData(localPlayer, "turbo:RacePacket") or "Race (0$)", 426, 375, 591, 424, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "top", false, false, false, false, false)
    end

    function openTurbo()
        if zmiennaTurbo == false then 
        if source ~= buttony.turbo then return end 
          addEventHandler("onClientRender", root, turbo)
          zmiennaTurbo = true 
        else 
            if zmiennaTurbo == true then 
            if source ~= buttony.turbo then return end 
            removeEventHandler("onClientRender", root, turbo)
            zmiennaTurbo = false 
            end 
        end 
    end
    addEventHandler("onClientGUIClick", root, openTurbo)

    function normalPacket()
        local veh = getPedOccupiedVehicle(localPlayer)
         if zmiennaTurbo == true then 
            if isMouseInPosition(426, 191, 591, 240) then 
                outputChatBox("Ten typ dodaje do maksymalnej prędkości 7km/h po aktywacji", 255, 255, 255)
                    addEventHandler("onClientDoubleClick", root, function()
                        if isMouseInPosition(426, 191, 591, 240) then 
                            triggerServerEvent("turbo:normal", localPlayer)
                            setElementData(localPlayer, "turbo:normal", "Zamontowałeś już ten pakiet!")
                            setElementData(veh, "turbo:normal", true)
                        end
                        end)
                    else 
                        if getElementData(veh, "turbo:normal") == true then 
                            outputChatBox("Zamontowałeś już ten pakiet!")
                            outputDebugString("brum,brum suko! dobry jestes")
                        end 
                    end 
                end 
            end
                addEventHandler("onClientClick", root, normalPacket)

                function PrototypePacket()
                    local veh = getPedOccupiedVehicle(localPlayer)
                     if zmiennaTurbo == true then 
                        if isMouseInPosition(426, 276, 591, 325) then 
                            outputChatBox("Ten typ dodaje do maksymalnej prędkości 15km/h po aktywacji", 255, 255, 255)
                                addEventHandler("onClientDoubleClick", root, function()
                                    if isMouseInPosition(426, 276, 591, 325) then 
                                        triggerServerEvent("turbo:PrototypePacket", localPlayer)
                                        setElementData(localPlayer, "turbo:PrototypePacket", "Zamontowałeś już ten pakiet!")
                                        setElementData(veh, "turbo:PrototypePacket", true)
                                    end
                                    end)
                                else 
                                    if getElementData(veh, "turbo:PrototypePacket") == true then 
                                        outputChatBox("Zamontowałeś już ten pakiet!")
                                        outputDebugString("brum,brum suko! dobry jestes")
                                    end 
                                end 
                            end 
                        end
                            addEventHandler("onClientClick", root, PrototypePacket)

                            function RacePacket()
                                local veh = getPedOccupiedVehicle(localPlayer)
                                 if zmiennaTurbo == true then 
                                    if isMouseInPosition(426, 375, 591, 424) then 
                                        outputChatBox("Ten typ dodaje do maksymalnej prędkości 23km/h po aktywacji", 255, 255, 255)
                                            addEventHandler("onClientDoubleClick", root, function()
                                                if isMouseInPosition(426, 375, 591, 424) then 
                                                    triggerServerEvent("turbo:RacePacket", localPlayer)
                                                    setElementData(localPlayer, "turbo:RacePacket", "Zamontowałeś już ten pakiet!")
                                                    setElementData(veh, "turbo:RacePacket", true)
                                                end
                                                end)
                                            else 
                                                if getElementData(veh, "turbo:RacePacket") == true then 
                                                    outputChatBox("Zamontowałeś już ten pakiet!")
                                                    outputDebugString("brum,brum suko! dobry jestes")
                                                end 
                                            end 
                                        end 
                                    end
                                        addEventHandler("onClientClick", root, RacePacket)


                                        --- hamulce 
                                        zmiennaHamulce = false 
                                        function hamulceRender()
                                            dxDrawRectangle(644, 181, 252, 320, tocolor(26, 26, 26, 175), false)
                                            dxDrawText(getElementData(localPlayer, "brakes:normalBrakes") or "Normal (0$)", 703, 191, 868, 240, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "top", false, false, false, false, false)
                                            dxDrawText(getElementData(localPlayer, "brakes:prototypeBrakes") or "Prototype (0$)", 703, 278, 868, 327, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "top", false, false, false, false, false)
                                            dxDrawText(getElementData(localPlayer, "brakes:raceBrakes") or "Race (0$)", 703, 370, 868, 419, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "top", false, false, false, false, false)
                                        end


                                        function openBrakes()
                                            if zmiennaHamulce == false then 
                                            if source ~= buttony.brakes then return end 
                                              addEventHandler("onClientRender", root, hamulceRender)
                                              zmiennaHamulce = true 
                                            else 
                                                if zmiennaHamulce == true then 
                                                if source ~= buttony.brakes then return end 
                                                removeEventHandler("onClientRender", root, hamulceRender)
                                                zmiennaHamulce = false 
                                                end 
                                            end 
                                        end
                                        addEventHandler("onClientGUIClick", root, openBrakes)

                                        function normalBrakes()
                                            local veh = getPedOccupiedVehicle(localPlayer)
                                             if zmiennaHamulce == true then 
                                                if isMouseInPosition(703, 191, 868, 240) then 
                                                    outputChatBox("Ten typ polepsza nieznacznie jakoś hamulców", 255, 255, 255)
                                                        addEventHandler("onClientDoubleClick", root, function()
                                                            if isMouseInPosition(703, 191, 868, 240) then 
                                                                triggerServerEvent("brakes:normalBrakes", localPlayer)
                                                                setElementData(localPlayer, "brakes:normalBrakes", "Zamontowałeś już ten pakiet!")
                                                                setElementData(veh, "brakes:normalBrakes", true)
                                                            end
                                                            end)
                                                        else 
                                                            if getElementData(veh, "brakes:normalBrakes") == true then 
                                                                outputChatBox("Zamontowałeś już ten pakiet!")
                                                                outputDebugString("brum,brum suko! dobry jestes")
                                                            end 
                                                        end 
                                                    end 
                                                end
                                                    addEventHandler("onClientClick", root, normalBrakes)

                                                    function prototypeBrakes()
                                                        local veh = getPedOccupiedVehicle(localPlayer)
                                                         if zmiennaHamulce == true then 
                                                            if isMouseInPosition(703, 278, 868, 327) then 
                                                                outputChatBox("Ten typ polepsza nieznacznie jakość hamulców", 255, 255, 255)
                                                                    addEventHandler("onClientDoubleClick", root, function()
                                                                        if isMouseInPosition(703, 278, 868, 327) then 
                                                                            triggerServerEvent("brakes:prototypeBrakes", localPlayer)
                                                                            setElementData(localPlayer, "brakes:prototypeBrakes", "Zamontowałeś już ten pakiet!")
                                                                            setElementData(veh, "brakes:prototypeBrakes", true)
                                                                        end
                                                                        end)
                                                                    else 
                                                                        if getElementData(veh, "brakes:prototypeBrakes") == true then 
                                                                            outputChatBox("Zamontowałeś już ten pakiet!")
                                                                            outputDebugString("brum,brum suko! dobry jestes")
                                                                        end 
                                                                    end 
                                                                end 
                                                            end
                                                                addEventHandler("onClientClick", root, prototypeBrakes)

                                                                function raceBrakes()
                                                                    local veh = getPedOccupiedVehicle(localPlayer)
                                                                     if zmiennaHamulce == true then 
                                                                        if isMouseInPosition(703, 370, 868, 419) then 
                                                                            outputChatBox("Ten typ polepsza mocno jakość hamulców", 255, 255, 255)
                                                                                addEventHandler("onClientDoubleClick", root, function()
                                                                                    if isMouseInPosition(703, 370, 868, 419) then 
                                                                                        triggerServerEvent("brakes:raceBrakes", localPlayer)
                                                                                        setElementData(localPlayer, "brakes:raceBrakes", "Zamontowałeś już ten pakiet!")
                                                                                        setElementData(veh, "brakes:raceBrakes", true)
                                                                                    end
                                                                                    end)
                                                                                else 
                                                                                    if getElementData(veh, "brakes:raceBrakes") == true then 
                                                                                        outputChatBox("Zamontowałeś już ten pakiet!")
                                                                                        outputDebugString("brum,brum suko! dobry jestes")
                                                                                    end 
                                                                                end 
                                                                            end 
                                                                        end
                                                                            addEventHandler("onClientClick", root, raceBrakes)

                                                                            --- pakiety ulepszen 
                                                                            zmiennaUlepszenia = false 

                                                                            function ule()
                                                                                dxDrawRectangle(948, 181, 252, 320, tocolor(26, 26, 26, 175), false)
                                                                                dxDrawText(getElementData(localPlayer, "packet:normalPacket") or "Normal (0$)", 1020, 191, 1185, 240, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "top", false, false, false, false, false)
                                                                                dxDrawText(getElementData(localPlayer, "packet:prototype") or "Prototype (0$)", 1020, 268, 1185, 317, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "top", false, false, false, false, false)
                                                                                dxDrawText(getElementData(localPlayer, "packet:RacePacket") or "Race (0$)", 1020, 358, 1185, 407, tocolor(255, 255, 255, 255), 2.00, "sans", "left", "top", false, false, false, false, false)
                                                                            end 

                                                                            function openPackets()
                                                                                if zmiennaUlepszenia == false then 
                                                                                if source ~= buttony.packages then return end 
                                                                                  addEventHandler("onClientRender", root, ule)
                                                                                  zmiennaUlepszenia = true 
                                                                                else 
                                                                                    if zmiennaUlepszenia == true then 
                                                                                    if source ~= buttony.packages then return end 
                                                                                    removeEventHandler("onClientRender", root, ule)
                                                                                    zmiennaUlepszenia = false 
                                                                                    end 
                                                                                end 
                                                                            end
    
                                                                            addEventHandler("onClientGUIClick", root, openPackets)

                                                                            function normalPacket()
                                                                                local veh = getPedOccupiedVehicle(localPlayer)
                                                                                 if zmiennaUlepszenia == true then 
                                                                                    if isMouseInPosition(1020, 191, 1185, 240) then 
                                                                                        outputChatBox("Ten typ dodaje 5km/h  do Vmaxu", 255, 255, 255)
                                                                                            addEventHandler("onClientDoubleClick", root, function()
                                                                                                if isMouseInPosition(1020, 191, 1185, 240) then 
                                                                                                    triggerServerEvent("packet:normalPacket", localPlayer)
                                                                                                    setElementData(localPlayer, "packet:normalPacket", "Zamontowałeś już ten pakiet!")
                                                                                                    setElementData(veh, "packet:normalPacket", true)
                                                                                                end
                                                                                                end)
                                                                                            else 
                                                                                                if getElementData(veh, "packet:normalPacket") == true then 
                                                                                                    outputChatBox("Zamontowałeś już ten pakiet!")
                                                                                                    outputDebugString("brum,brum suko! dobry jestes")
                                                                                                end 
                                                                                            end 
                                                                                        end 
                                                                                    end
                                                                                        addEventHandler("onClientClick", root, normalPacket)

                                                                                        function prototypePacket()
                                                                                            local veh = getPedOccupiedVehicle(localPlayer)
                                                                                             if zmiennaUlepszenia == true then 
                                                                                                if isMouseInPosition(1020, 268, 1185, 317) then 
                                                                                                    outputChatBox("Ten typ dodaje 10km/h  do Vmaxu", 255, 255, 255)
                                                                                                        addEventHandler("onClientDoubleClick", root, function()
                                                                                                            if isMouseInPosition(1020, 268, 1185, 317) then 
                                                                                                                triggerServerEvent("packet:prototype", localPlayer)
                                                                                                                setElementData(localPlayer, "packet:prototype", "Zamontowałeś już ten pakiet!")
                                                                                                                setElementData(veh, "packet:prototype", true)
                                                                                                            end
                                                                                                            end)
                                                                                                        else 
                                                                                                            if getElementData(veh, "packet:prototype") == true then 
                                                                                                                outputChatBox("Zamontowałeś już ten pakiet!")
                                                                                                                outputDebugString("brum,brum suko! dobry jestes")
                                                                                                            end 
                                                                                                        end 
                                                                                                    end 
                                                                                                end
                                                                                                    addEventHandler("onClientClick", root, prototypePacket)

                                                                                                    function RacePacket()
                                                                                                        local veh = getPedOccupiedVehicle(localPlayer)
                                                                                                         if zmiennaUlepszenia == true then 
                                                                                                            if isMouseInPosition(1020, 358, 1185, 407) then 
                                                                                                                outputChatBox("Ten typ dodaje 20km/h  do Vmaxu", 255, 255, 255)
                                                                                                                    addEventHandler("onClientDoubleClick", root, function()
                                                                                                                        if isMouseInPosition(1020, 358, 1185, 407) then 
                                                                                                                            triggerServerEvent("packet:RacePacket", localPlayer)
                                                                                                                            setElementData(localPlayer, "packet:RacePacket", "Zamontowałeś już ten pakiet!")
                                                                                                                            setElementData(veh, "packet:RacePacket", true)
                                                                                                                        end
                                                                                                                        end)
                                                                                                                    else 
                                                                                                                        if getElementData(veh, "packet:RacePacket") == true then 
                                                                                                                            outputChatBox("Zamontowałeś już ten pakiet!")
                                                                                                                            outputDebugString("brum,brum suko! dobry jestes")
                                                                                                                        end 
                                                                                                                    end 
                                                                                                                end 
                                                                                                            end
                                                                                                                addEventHandler("onClientClick", root, RacePacket)

 bindKey("enter", "down", function()
 local veh = getPedOccupiedVehicle(localPlayer)
      if veh then 
        --setElementPosition(localPlayer, -2047.31433, 176.43933, 28.83594)
        setElementInterior(localPlayer, 0)
        setElementPosition(veh, -715.25244, 960.04950, 12.22235)
        setElementInterior(veh, 0)
        --warpPedIntoVehicle(localPlayer, veh)
        setCameraTarget(localPlayer)
        setElementFrozen(localPlayer, false)
       -- setElementFrozen(veh, true)
        guiSetVisible(buttony.turbo, false)
        guiSetVisible(buttony.brakes, false)
        guiSetVisible(buttony.packages, false) 
        setPlayerHudComponentVisible("all", true)
        setVehicleEngineState(veh, true)
        showCursor(false)
        removeEventHandler("onClientRender", root, onPlayerEnterRender)
          if zmiennaUlepszenia == true then 
            removeEventHandler("onClientRender", root, ole)
            zmiennaUlepszenia = false 
         else 
            if zmiennaHamulce == true then 
                removeEventHandler("onClientRender", root, hamulceRender)
                zmiennaHamulce = false 
            else 
                if zmiennaTurbo == true then 
                    removeEventHandler("onClientRender", root, turbo)
                    zmiennaTurbo =  false 
                end 
            end 
        end 
    end 
end)




            


                        