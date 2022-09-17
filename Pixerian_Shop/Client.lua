
shopMainMenu = RageUI.CreateMenu("Superette", "Interaction")
shopMainMenu:setData('index', 1)
shopMainMenu:setData('account', 'money')

shopMainMenu:setMenu(function()
    shopMainMenu:IsVisible(function(item)
        item:AddList("Compte: ", {"Argent liquide", "Argent en banque"}, shopMainMenu:getData('index'), nil, {}, function(currentIndex, _, c)
            if c then
                shopMainMenu:setData('index', currentIndex)
            end
            if currentIndex == 1 then
                shopMainMenu:setData('account', 'money')
            elseif currentIndex == 2 then
                shopMainMenu:setData('account', 'bank')
            end
        end)
        item:AddSeparator(("%s"):format(Shop.Categorie1))
        item:AddLine(Shop.Line1.r, Shop.Line1.g, Shop.Line1.b, Shop.Line1.a)
        for _, v in pairs(Shop.food) do
            item:AddButton(v.label, nil, {RightLabel = ("%s~g~$"):format(v.price)}, function(s)
                if s then
                    if shopMainMenu:getData('account') ~= nil then
                        local quantity = keyboardInput(("Combien voulez-vous acheter de %s ?"):format(v.label), 2, 1)
                        quantity = tonumber(quantity)
                        if quantity > 0 then
                            ESX.TriggerServerCallback('pixerianshop:buyitemsfood', function(returned)
                            end, v.name, quantity, shopMainMenu:getData('account'))
                        else
                            utils:notification("~r~Quantité invalide")
                        end
                    else
                        utils:notification("~r~Vous devez choisir un compte")
                    end
                end
            end)
        end

        item:AddSeparator(("%s"):format(Shop.Categorie2))
        item:AddLine(Shop.Line2.r, Shop.Line2.g, Shop.Line2.b, Shop.Line2.a)
        for _, v in pairs(Shop.utils) do
            item:AddButton(v.label, nil, {RightLabel = ("%s~g~$"):format(v.price)}, function(s)
                if s then
                    if shopMainMenu:getData('account') ~= nil then
                        local quantity = keyboardInput(("Combien voulez-vous acheter de %s ?"):format(v.label), 2, 1)
                        quantity = tonumber(quantity)
                        if quantity > 0 then
                            ESX.TriggerServerCallback('pixerianshop:buyitemsutils', function(returned)
                            end, v.name, quantity, shopMainMenu:getData('account'))
                        else
                            utils:notification("~r~Quantité invalide")
                        end
                    else
                        utils:notification("~r~Vous devez choisir un compte")
                    end
                end
            end)
        end
    end)
end)

local function Draw3DText(x, y, z, text)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
	if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(8)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextDropShadow(0, 0, 0, 55)
		SetTextEdge(0, 0, 0, 150)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
	end
end

function keyboardInput(textEntry, maxLenght, text, text2, text3, text4)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", nil or text, nil or text2, nil or text3, nil or text4, maxLenght or 10)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        DisableAllControlActions(0);
        Wait(0)
    end
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Wait(500)
        return result
    else
        Wait(500)
        return nil
    end
end

Citizen.CreateThread(function()
    for k,v in pairs(Shop.Pos) do
        blip = AddBlipForCoord(v.pos.x,v.pos.y,v.pos.z)

        SetBlipSprite(blip, 59)
        SetBlipScale(blip, 0.6)
        SetBlipColour(blip, 30)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName("Superette")
        EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPos = GetEntityCoords(PlayerPedId())
        for k,v in pairs(Shop.Pos) do
            local PositionSup = vector3(v.pos)
            local dst1 = #(playerPos - PositionSup)
            if dst1 < 4.0 then
                sleep = 0
                if scale == nil then
                    scale = 0.75
                end
                Draw3DText(v.pos.x,v.pos.y,v.pos.z, ("Appuyer sur ~c~[~%s~E~c~]~s~ pour ~%s~Interagir"):format(Shop.MarkerTextColor,Shop.MarkerTextColor))
                DrawMarker(6, v.pos.x,v.pos.y,v.pos.z-1.0, 0.0, 0.0, 0.0, -90, 0.0, 0.0, scale, scale, 0.75, Shop.MarkerRGB.r, Shop.MarkerRGB.g, Shop.MarkerRGB.b, Shop.MarkerRGB.a1, false, false, nil, false, false, false, false);
                DrawMarker(1, v.pos.x,v.pos.y,v.pos.z-1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, scale, scale, 0.3, Shop.MarkerRGB.r, Shop.MarkerRGB.g, Shop.MarkerRGB.b, Shop.MarkerRGB.a2, false, false, nil, false, false, false, false);
                if dst1 < 1.5 then
                    sleep = 0
                    if IsControlJustReleased(1, 38) then
                        shopMainMenu:openMenu()
                    end
                end
            end
        end
        Wait(sleep)
    end
end)