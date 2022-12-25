-- You shouldn't need to config this usually unless you're translating
-- Honestly it should make sense, if not make a support ticket.
function F4Menu:CreateCommands()
  F4Menu.Commands = {}

  F4Menu:CreateCommandCategory("options.general.name")
    :AddCommand({
      name = "options.general.dropMoney.name",
      input = {
        desc = "options.general.dropMoney.desc",
        placeholder = "options.general.dropMoney.placeholder",
        numeric = true
      },
      func = function(ply, value)
        ply:ConCommand("say /dropmoney " .. value)
      end
    })
    :AddCommand({
      name = "options.general.giveMoney.name",
      input = {
        desc = "options.general.giveMoney.desc",
        placeholder = "options.general.giveMoney.placeholder",
        numeric = true
      },
      func = function(ply, value)
        ply:ConCommand("say /give " .. value)
      end
    })
    :AddCommand({
      name = "options.general.changeName.name",
      input = {
        desc = "options.general.changeName.desc",
        placeholder = "options.general.changeName.placeholder",
      },
      func = function(ply, value)
        ply:ConCommand("say /rpname " .. value)
      end
    })
    :AddCommand({
      name = "options.general.changeJobTitle.name",
      input = {
        desc = "options.general.changeJobTitle.desc",
        placeholder = "options.general.changeJobTitle.placeholder",
      },
      func = function(ply, value)
        ply:ConCommand("say /job " .. value)
      end
    }):AddCommand({
      name = "options.general.requestGunLicense.name",
      func = function(ply, value)
        ply:ConCommand("say /requestlicense")
      end
    }):AddCommand({
      name = "options.general.sellAllDoors.name",
      func = function(ply)
        ply:ConCommand("say /sellalldoors")
      end
    }):AddCommand({
      name = "options.general.dropWeapon.name",
      func = function(ply)
        ply:ConCommand("say /drop")
      end
    }):AddCommand({
      name = "options.general.cheque.name",
      input = {
        desc = "options.general.cheque.desc",
        placeholder = "options.general.cheque.amount",
        numeric = true
      },
      option = true,
      func = function(ply, value, pnl, sid64)
        if (!sid64) then return end
        local target = player.GetBySteamID64(sid64)
        if (!IsValid(target)) then return end
        local name = target:Nick()

        ply:ConCommand("say /cheque \"" .. name .. "\" " .. value)
      end
  })

  F4Menu:CreateCommandCategory("options.police.name", {
    customCheck = function(ply) return ply:isCP() end
  }):AddCommand({
      name = "options.police.wanted.name",
      input = {
        desc = "options.police.wanted.desc",
        placeholder = "options.police.wanted.placeholder"
      },
      option = function(ply)
        return !ply:isWanted() and !ply:isCP()
      end,
      func = function(ply, value, pnl, sid64)
        if (!sid64) then return end
        local target = player.GetBySteamID64(sid64)
        if (!IsValid(target)) then return end
        local name = target:Nick()

        ply:ConCommand("say /wanted \"" .. name .. "\" " .. value)
      end
  }):AddCommand({
      name = "options.police.warrant.name",
      input = {
        desc = "options.police.warrant.desc",
        placeholder = "options.police.warrant.placeholder"
      },
      option = function(ply)
        return !ply:isCP()
      end,
      func = function(ply, value, pnl, sid64)
        if (!sid64) then return end
        local target = player.GetBySteamID64(sid64)
        if (!IsValid(target)) then return end
        local name = target:Nick()

        ply:ConCommand("say /warrant \"" .. name .. "\" " .. value)
      end
  }):AddCommand({
      name = "options.police.unwarrant.name",
      input = {
        desc = "options.police.unwarrant.desc",
        placeholder = "options.police.unwarrant.placeholder",
        removeField = true
      },
      option = function(ply)
        return !ply:isCP()
      end,
      func = function(ply, value, pnl, sid64)
        if (!sid64) then return end
        local target = player.GetBySteamID64(sid64)
        if (!IsValid(target)) then return end
        local name = target:Nick()

        ply:ConCommand("say /unwarrant \"" .. name .. "\"")
      end
    })

  F4Menu:CreateCommandCategory("options.mayor.name", {
    customCheck = function(ply) return ply:getJobTable().mayor end
  }):AddCommand({
    name = "options.mayor.startLockdown.name",
    func = function(ply)
      ply:ConCommand("say /lockdown")
    end
  }):AddCommand({
    name = "options.mayor.stopLockdown.name",
    func = function(ply)
      ply:ConCommand("say /unlockdown")
    end
  }):AddCommand({
    name = "options.mayor.giveLicense.name",
    func = function(ply)
      ply:ConCommand("say /givelicense")
    end
  }):AddCommand({
    name = "options.mayor.addLaw.name",
    input = {
      desc = "options.mayor.addLaw.desc",
      placeholder = "options.mayor.addLaw.placeholder"
    },
    func = function(ply, value)
      ply:ConCommand("say /addlaw " .. value)
    end
  }):AddCommand({
    name = "options.mayor.removeLaw.name",
    input = {
      desc = "options.mayor.removeLaw.desc",
      placeholder = "options.mayor.removeLaw.placeholder"
    },
    func = function(ply, value)
      ply:ConCommand("say /removelaw " .. value)
    end
  }):AddCommand({
    name = "options.mayor.resetLaws.name",
    func = function(ply, value)
      ply:ConCommand("say /resetlaws")
    end
  }):AddCommand({
    name = "options.mayor.placeLawboard.name",
    func = function(ply, value)
      ply:ConCommand("say /placelaws")
    end
  }):AddCommand({
    name = "options.mayor.broadcastToCity.name",
    input = {
      desc = "options.mayor.broadcastToCity.desc",
      placeholder = "options.mayor.broadcastToCity.placeholder"
    },
    func = function(ply, value)
      ply:ConCommand("say /broadcast " .. value)
    end
  }):AddCommand({
    name = "options.mayor.startLottery.name",
    input = {
      desc = "options.mayor.startLottery.desc",
      placeholder = "options.mayor.startLottery.placeholder",
      numeric = true
    },
    func = function(ply, value)
      ply:ConCommand("say /lottery")
    end
  })
end