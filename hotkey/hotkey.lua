local hyper = {'ctrl', 'cmd'}

-- The new mac has a predefined hot key
-- hs.hotkey.bind({"cmd"}, "L", hs.caffeinate.lockScreen)
-- hs.hotkey.bind({"cmd"}, "L", hs.caffeinate.systemSleep)

hs.hotkey.bind(hyper, "T", function () hs.application.launchOrFocus("iTerm") end)
-- hs.hotkey.bind(hyper, "T", function () hs.application.launchOrFocus("Terminal") end)