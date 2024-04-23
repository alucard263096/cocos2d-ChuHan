
local MenuScene = class("MenuScene", cc.load("mvc").ViewBase)

function MenuScene:onCreate()

    cc.Label:createWithSystemFont("楚汉", "Arial", 100)
        :move(display.cx, display.cy + 200)
        :addTo(self)

    -- add play button
    local playButton = cc.MenuItemImage:create("button/PlayButton.png", "button/PlayButton.png")
        :onClicked(function() 
            self:getApp():enterScene("IntroductionScene")
        end)
    -- add exit button
    local exitButton = cc.MenuItemImage:create("button/ExitButton.png", "button/ExitButton.png")
        :onClicked(function() 
            cc.Director:getInstance():endToLua()
        end)
    cc.Menu:create(playButton,exitButton)
        :alignItemsVerticallyWithPadding(10)  -- 设置垂直方向的间距
        :move(display.cx, display.cy - 150)
        :addTo(self)

end

return MenuScene
