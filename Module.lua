local textChatService = game:GetService("TextChatService")
local plr = game:GetService("Players")

textChatService.OnIncomingMessage = function(message: TextChatMessage)
    
    local properties = Instance.new("TextChatMessageProperties")
    
    if message.TextSource then
        
        local player = plr:GetPlayerByUserId(message.TextSource.UserId)
        
        if player.UserId == 5807600241 then
            
            properties.PrefixText = "<font color='#00ffee'>[QPHub Dev]</font> " .. "<font color='#000000'>[Mommy Muqh]</font> " .. message.PrefixText
            
        end
        
    end
    
    return properties
    
end
