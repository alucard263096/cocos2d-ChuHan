local AdvertisementScene = class("AdvertisementScene", cc.load("mvc").ViewBase)

function AdvertisementScene:onCreate()
    
    local backgroundImages = {"adv/adv1.png", "adv/adv2.png", "adv/adv3.png"}
    -- 使用 pairs 遍历数组
    for index, image in pairs(backgroundImages) do
        self:addAdvSprite(image,index-1)
    end

    local delayAction = cc.DelayTime:create(#backgroundImages * 5)  
    local function changeScene()  
        self:getApp():enterScene("MenuScene")

        cc.Label:createWithSystemFont("Hello World", "Arial", 40)
        :move(display.cx, display.cy)
        :addTo(self)
    end
    local sequence = cc.Sequence:create(delayAction, cc.CallFunc:create(changeScene))  -- 创建一个动作序列，包含延迟动作和调用切换场景函数的动作
    self:runAction(sequence)
    
end

function AdvertisementScene:addExtraLabel()
    -- 在定时器回调函数内部添加额外的标签
    cc.Label:createWithSystemFont("Adv", "Arial", 40)
        :move(display.cx, display.cy)
        :addTo(self)
end

function AdvertisementScene:addAdvSprite(pngPath,inx)
    -- 在定时器回调函数内部添加额外的标签
    -- 创建背景精灵
    local backgroundSprite = cc.Sprite:create(pngPath)

    -- 获取屏幕高度
    local screenHeight = display.height

    -- 获取背景图片的原始尺寸
    local imageSize = backgroundSprite:getContentSize()

    -- 计算缩放比例
    local scale = screenHeight / imageSize.height

    -- 设置背景精灵的缩放比例
    backgroundSprite:setScale(scale)

    -- 设置背景精灵的位置为屏幕中心
    backgroundSprite:setPosition(display.center)
    backgroundSprite:setOpacity(0)
    -- 将背景精灵添加到场景中
    self:addChild(backgroundSprite)

    local fadeInAction = cc.FadeIn:create(1)
        -- 淡出效果
    local fadeOutAction = cc.FadeOut:create(1)
        -- 创建淡入淡出动画序列
    local sequenceAction = cc.Sequence:create(cc.DelayTime:create(inx*5), fadeInAction, cc.DelayTime:create(3), fadeOutAction)

    backgroundSprite:runAction(sequenceAction)

end

return AdvertisementScene
