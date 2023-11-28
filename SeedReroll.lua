--[[
    SeedReroll
    Author: SleepSoul (Discord: sleepsoul)
    Dependencies: ModUtil
    Add a button to reroll the next run's seed while in the courtyard.
]]
ModUtil.Mod.Register( "SeedReroll" )

ModUtil.Path.Wrap( "CreatePrimaryBacking", function ( baseFunc )
    -- Only show button between runs
    if not ModUtil.Path.Get( "CurrentDeathAreaRoom" ) then
        return baseFunc()
    end
  
    local components = ScreenAnchors.TraitTrayScreen.Components
    components.SeedRerollButton = CreateScreenComponent({
        Name = "ButtonDefault",
        Scale = 0.7,
        Group = "Combat_Menu_TraitTray",
        X = CombatUI.TraitUIStart + 135,
        Y = 185 })
    components.SeedRerollButton.OnPressedFunctionName = "SeedReroll.RerollSeed"
    CreateTextBox({ Id = components.SeedRerollButton.Id,
        Text = "Reroll Seed",
        OffsetX = 0, OffsetY = 0,
        FontSize = 22,
        Color = Color.White,
        Font = "AlegreyaSansSCRegular",
        ShadowBlur = 0, ShadowColor = {0,0,0,1}, ShadowOffset={0, 2},
        Justification = "Center",
        DataProperties =
        {
            OpacityWithOwner = true,
        },
    })
    Attach({ Id = components.SeedRerollButton.Id, DestinationId = components.SeedRerollButton, OffsetX = 500, OffsetY = 500 })
    baseFunc()
end, SeedReroll )

function SeedReroll.RerollSeed()
    RandomSetNextInitSeed()
	PlaySound({ Name = "/SFX/Menu Sounds/DialoguePanelIn" })
end
