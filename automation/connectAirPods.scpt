activate application "SystemUIServer"
tell application "System Events"
  tell process "SystemUIServer"
    -- Working CONNECT Script.  Goes through the following:
    -- Clicks on Bluetooth Menu (OSX Top Menu Bar)
    --    => Clicks on SX-991 Item
    --      => Clicks on Connect Item
    set btMenu to (menu bar item 1 of menu bar 1 whose description contains "bluetooth")
    tell btMenu
      click
      tell (menu item "Artur’s AirPods Pro" of menu 1)
        click
        if exists menu item "Connect" of menu 1 then
          click menu item "Connect" of menu 1
          return "Connecting..."
        else
          click btMenu -- Close main BT drop down if Connect wasn't present
          return "Connect menu was not found, are you already connected?"
        end if
      end tell
    end tell
  end tell
end tell
