local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "TrueShot",
    LoadingTitle = "TrueShot.cc the best script!",
    Discord = {
       Enabled = true,
       Invite = "D5AhD6Jecb", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = false -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "Key",
       Subtitle = "Key System",
       Note = "Discord.gg/D5AhD6Jecb",
       FileName = "trueshotkey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"TrueShotOwnsOnGang!"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })
 local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
 local Button = Tab:CreateButton({
   Name = "Execute script",
   Callback = function()
      local gameId = game.PlaceId

      if gameId == 5732301513 then -- Trenches
         loadstring(game:HttpGet("https://trueshot.cc/scripts/tre.lua"))()
      elseif gameId == 8204899140 then -- FF2 Main
         loadstring(game:HttpGet("https://trueshot.cc/scripts/FF2.lua"))()
      elseif gameId == 8206123457 then -- FF2 Practice
         loadstring(game:HttpGet("https://trueshot.cc/scripts/FF2.lua"))()
      elseif gameId == 292439477 then -- phantom forces
         loadstring(game:HttpGet("https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/pf_lite.lua"))()
      else
         loadstring(game:HttpGet("https://trueshot.cc/scripts/uni.lua"))()
      end
      
   end,
})
      --[[ elseif gameId == 4483381587 then
          print("baseplate")--]]
