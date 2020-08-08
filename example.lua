---
--- @author Dylan MALANDAIN
--- @version 2.0.0
--- @since 2020
---
--- RageUI Is Advanced UI Libs in LUA for make beautiful interface like RockStar GAME.
---
---
--- Commercial Info.
--- Any use for commercial purposes is strictly prohibited and will be punished.
---
--- @see RageUI
---

print("^1 RageUI - testing file is started. ^0")

RMenu.Add('showcase', 'main', RageUI.CreateMenu("RageUI", "Undefined for using SetSubtitle"))
RMenu:Get('showcase', 'main'):SetSubtitle("RageUI Showcase")
RMenu:Get('showcase', 'main'):DisplayGlare(true);


RMenu:Get('showcase', 'main').Closed = function()
    print('Closed Showcase Menu')
end;
RMenu:Get('showcase', 'main').onIndexChange = function(Index)
    print(Index)
end

RMenu.Add('showcase', 'submenu', RageUI.CreateSubMenu(RMenu:Get('showcase', 'main'), "SubMenu", "RAGEUI"))
RMenu:Get('showcase', 'submenu').EnableMouse = true

RMenu:Get('showcase', 'submenu').Closed = function()
    print('Closed Showcase Menu')
end;

RMenu:Get('showcase', 'submenu').onIndexChange = function(Index)
    print(Index)
end

Keys.Register('E', 'E', 'Open RageUI Showcase menu default.', function()
    RageUI.Visible(RMenu:Get('showcase', 'main'), not RageUI.Visible(RMenu:Get('showcase', 'main')))
end)

heritageValue = 0.1

Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(1.0)

        RageUI.IsVisible(RMenu:Get('showcase', 'main'), function()
            RageUI.Item.Checkbox("This is a checkbox", "Click me!", true, { CheckboxStyle = RageUI.CheckboxStyle.Tick },{
                onHovered = function()

                end,
                onChecked = function()
                    print('You checked the checkbox!')
                end,
                onUnChecked = function()
                    print('You unchecked the checkbox! :(')
                end,
                onSelected = function()

                end,
                onActive = function()
                    RMenu:Get('showcase', 'main'):SetSubtitle("You are on the checkbox!")
                end
            })

            RageUI.Item.List("A list of items", { "Yes", "No", "Maybe ?", "Money" }, 1, nil, {}, true, {
                onListChange = function(Index, Item)
                    print(Item)
                end,
                onSelected = function(Index, Item)

                end,
                onHovered = function(Index, Item)

                end
            })

            RageUI.Item.Separator('~~~~ This is a seperator. ~~~~')

            local sliderTable = {0,1,2,3,4,5,6,7,8,9,10}

            RageUI.Item.Slider("Slider", sliderTable, 5, "Slider between 0 and 10", true, {}, true, {
                onSliderChange = function(Index) 
                    RMenu:Get('showcase', 'main'):SetSubtitle("Slider Value: " .. sliderTable[Index])
                end,
                onSelected = function(Value)
                end,
                onHovered = function()
                end
            })

            RageUI.Item.UISliderHeritage("Heritage Slider", heritageValue, "Slider between 0 and 10", {
                onSliderChange = function(x,y) 
                    RMenu:Get('showcase', 'main'):SetSubtitle("Slider Value: " .. x .. " " .. y)
                end,
                onSelected = function(Value)
                end,
                onHovered = function()
                end
            }, heritageValue)
        end)

        RageUI.IsVisible(RMenu:Get('showcase', 'submenu'), function()
            for i = 1, 11 do
                RageUI.Item.List("List Items", { "Yes", "No", "Maybe ?", "Money" }, 1, nil, {}, true, {
                    onListChange = function(Index, Items)

                    end,
                    onSelected = function(Index, Items)

                    end,
                    onHovered = function(Index, Items)

                    end
                })
            end
        end, function()

            RageUI.Panel.ColourPanel('Title', RageUI.PanelColour.HairCut, 5, {
                onColourChange = function(Index)
                    print(Index)
                end,
                onSelected = function()

                end
            }, 1)

            RageUI.Panel.Grid(0.5, 0.2, 'TopText', 'BottomText', 'LeftText', 'RightText', {
                onPositionChange = function(X, Y)
                    print(X, Y)
                end,
                onSelected = function(X, Y)
                    print(X, Y)
                end
            }, 2)

            RageUI.Panel.GridHorizontal(0.1, 'LeftText', 'RightText', {
                onPositionChange = function(X, Y)
                    print(X, Y)
                end,
                onSelected = function(X, Y)
                    print(X, Y)
                end
            }, 3)

            RageUI.Panel.GridVertical(0.1, 'TopText', 'BottomText', {
                onPositionChange = function(X, Y)
                    print(X, Y)
                end,
                onSelected = function(X, Y)
                    print(X, Y)
                end
            }, 4)

            RageUI.Panel.PercentagePanel(1.0, "HeaderText", "MinText", "MaxText", {
                onPercentageChange = function(Percentage)
                    print(Percentage)
                end,
                onSelected = function(Percentage)
                    print(Percentage)
                end
            }, 5)

        end)


    end
end)
