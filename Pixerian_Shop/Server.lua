print("[^5Pixerian - Community^7] [^1INFO^7] ESX ^5Shop^0 initialized")

ESX.RegisterServerCallback('pixerianshop:buyitemsfood', function(src, cb, name, count, accountSelected)
    local xPlayer = ESX.GetPlayerFromId(src)
    if Shop.food[name].name == name then
        local item = Shop.food[name]
        if xPlayer.getAccount(accountSelected).money >= item.price then
            if xPlayer.canCarryItem(item.name, count) then
                xPlayer.removeAccountMoney(accountSelected, item.price * count)
                xPlayer.addInventoryItem(item.name, count)
                xPlayer.showNotification(("Vous avez acheter :\n- ~y~%s ~%s~%s~s~"):format(count, Shop.MarkerTextColor, item.label))
                cb(true)
            else
                xPlayer.showNotification(('~r~Vous ne pouvez pas prendre plus de ~%s~%s.'):format(Shop.MarkerTextColor, item.label))
                cb(false)
            end
        else
            xPlayer.showNotification(('~r~Vous n\'avez pas assez d\'argent pour acheter un(e) ~%s~%s.'):format(Shop.MarkerTextColor, item.label))
            cb(false)
        end
    else
        cb(false)
    end
end)

ESX.RegisterServerCallback('pixerianshop:buyitemsutils', function(src, cb, name, count, accountSelected)
    local xPlayer = ESX.GetPlayerFromId(src)
    if Shop.utils[name].name == name then
        local item = Shop.utils[name]
        if xPlayer.getAccount(accountSelected).money >= item.price then
            if xPlayer.canCarryItem(item.name, count) then
                xPlayer.removeAccountMoney(accountSelected, item.price * count)
                xPlayer.addInventoryItem(item.name, count)
                xPlayer.showNotification(("Vous avez acheter :\n- ~y~%s ~%s~%s~s~"):format(count, Shop.MarkerTextColor, item.label))
                cb(true)
            else
                xPlayer.showNotification(('~r~Vous ne pouvez pas prendre plus de ~%s~%s.'):format(Shop.MarkerTextColor, item.label))
                cb(false)
            end
        else
            xPlayer.showNotification(('~r~Vous n\'avez pas assez d\'argent pour acheter un(e) ~%s~%s.'):format(Shop.MarkerTextColor, item.label))
            cb(false)
        end
    else
        cb(false)
    end
end)