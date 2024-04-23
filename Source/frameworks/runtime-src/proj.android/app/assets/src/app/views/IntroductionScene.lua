
local IntroductionScene = class("IntroductionScene", cc.load("mvc").ViewBase)


function IntroductionScene:onCreate()
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local origin = cc.Director:getInstance():getVisibleOrigin()

    -- 创建背景
    local bg = cc.Sprite:create("image/introduce_background.jpg")
    bg:setPosition(origin.x + visibleSize.width / 2, origin.y + visibleSize.height / 2)
    self:addChild(bg)

    -- 读取文本文件
    local filePath = cc.FileUtils:getInstance():fullPathForFilename("txt/introduction.txt")
    local fileData = cc.FileUtils:getInstance():getStringFromFile(filePath)
    
    -- 将文本内容按段落和行切分
    local lines = {}
    local line = ""
    
    print("thisischeap0",fileData)
    for paragraph in string.gmatch(fileData, "[^\r\n]+") do
        print("thisischeap1",paragraph)
        for _, char in utf8.codes(paragraph) do
            print("thisischeap2",utf8.char(char))
        end
        -- for word in string.gmatch(paragraph, "%S+") do
        --     print("thisischeap2",string.len(line))
        --     if string.len(line) == 20 then
        --         table.insert(lines, line)
        --         line = word
        --     else
        --         line = line .. word
        --     end
        -- end
    end
    for i, line in ipairs(lines) do
        print("thisischeap",line)
    end
    

    

    -- 等待3秒后切换到下一个场景
    self:runAction(cc.Sequence:create(cc.DelayTime:create(delay + 3), cc.CallFunc:create(function()
        self:switchToNextScene()
    end)))

end

return IntroductionScene
