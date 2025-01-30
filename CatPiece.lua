local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)

if not success then
    warn("Failed to load Rayfield UI Library!")
    return
else
    print("Rayfield Library loaded successfully!")
end

local Window = Rayfield:CreateWindow({
    Name = "Yuki Hub Cat Piece",
    LoadingTitle = "Fruit & Items Selector",
    LoadingSubtitle = "Made by wzlfsdev",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ItemConfigs",
        FileName = "ItemSelector"
    },
    Discord = {
        Enabled = true,
        Invite = "QYP4VWz8",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Yuki Hub Cat Piece | Key",
        Subtitle = "Enter the key below to continue",
        Note = "Join our Discord server for the key: https://discord.gg/QYP4VWz8",
        FileName = "CatPieceKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Khuand"}
    }
})

local FruitTab = Window:CreateTab("Fruit Selector", nil)
local FruitSection = FruitTab:CreateSection("Select a Fruit")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Items = ReplicatedStorage:WaitForChild("Items")

for _, tool in ipairs(Items:GetChildren()) do
    if tool:IsA("Tool") and tool:FindFirstChild("TypeFruit") and tool.TypeFruit:IsA("StringValue") then
        local fruitName = tool.TypeFruit.Value
        
        FruitTab:CreateButton({
            Name = "Eat " .. fruitName,
            Callback = function()
                local args = {
                    [1] = "Eat",
                    [2] = "YetiFruit",
                    [3] = fruitName
                }
                ReplicatedStorage:WaitForChild("SystemFruitEatV1"):WaitForChild("SecureEated"):FireServer(unpack(args))
                print("Ate fruit:", fruitName)
            end
        })
    end
end

local ItemsTab = Window:CreateTab("Swords & Accessories", nil)
local ItemsSection = ItemsTab:CreateSection("Get All Items")

ItemsTab:CreateButton({
    Name = "Get All Accessories",
    Callback = function()
        local player = game.Players.LocalPlayer
        local accessoryInventory = player:WaitForChild("AccessoryInventoryList")

        for _, value in pairs(accessoryInventory:GetChildren()) do
            if value:IsA("BoolValue") then
                value.Value = true
            end
        end
        print("All Accessories Set to True!")
    end
})

ItemsTab:CreateButton({
    Name = "Get All Swords",
    Callback = function()
        local player = game.Players.LocalPlayer
        local swordInventory = player:WaitForChild("InventoryList")

        for _, value in pairs(swordInventory:GetChildren()) do
            if value:IsA("BoolValue") then
                value.Value = true
            end
        end
        print("All Swords Set to True!")
    end
})

local CreditsTab = Window:CreateTab("Credits", nil)
CreditsTab:CreateButton({
    Name = "Made by wzlfsdev",
    Callback = function()
        print("Script made by wzlfsdev")
    end
})