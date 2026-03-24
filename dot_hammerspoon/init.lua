-- ================================
-- App cycling + hide behavior
-- ================================
local function focusCycleHide(appName)
  local app = hs.application.get(appName)

  -- Launch if not running
  if not app then
    hs.application.launchOrFocus(appName)
    return
  end

  local windows = app:allWindows()

  -- Filter only standard windows
  local filtered = {}
  for _, win in ipairs(windows) do
    if win:isStandard() then
      table.insert(filtered, win)
    end
  end

  if #filtered == 0 then
    app:activate()
    return
  end

  local frontApp = hs.application.frontmostApplication()
  local frontWindow = hs.window.frontmostWindow()

  -- If app is already frontmost
  if frontApp and frontApp:name() == appName then
    -- Single window → hide on second press
    if #filtered == 1 then
      app:hide()
      return
    end

    -- Find current window index
    local index = nil
    for i, win in ipairs(filtered) do
      if frontWindow and win:id() == frontWindow:id() then
        index = i
        break
      end
    end

    if index then
      local nextIndex = index % #filtered + 1

      -- Loop back → hide app
      if nextIndex == 1 then
        app:hide()
      else
        filtered[nextIndex]:focus()
      end
      return
    end
  end

  -- Otherwise focus first window
  filtered[1]:focus()
end

-- ================================
-- Keybindings
-- ================================

hs.hotkey.bind({ "cmd" }, "1", function()
  focusCycleHide("Google Chrome")
end)

hs.hotkey.bind({ "cmd" }, "2", function()
  focusCycleHide("Slack")
end)

hs.hotkey.bind({ "cmd" }, "3", function()
  focusCycleHide("Spotify")
end)

hs.hotkey.bind({ "cmd" }, "4", function()
  focusCycleHide("Mail")
end)

hs.hotkey.bind({ "cmd" }, "5", function()
  focusCycleHide("Calendar")
end)

hs.hotkey.bind({ "cmd" }, "`", function()
  focusCycleHide("Alacritty")
end)
