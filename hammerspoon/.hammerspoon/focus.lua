function launchOrFocusByBundleID(bundleId)
    return function()
        hs.application.launchOrFocusByBundleID(bundleId)
    end
end

-- "com.apple.Terminal"
-- "com.googlecode.iterm2"
local terminal = "com.mitchellh.ghostty"

hs.hotkey.bind({"alt"}, "1", launchOrFocusByBundleID("com.apple.finder"))
hs.hotkey.bind({"alt"}, "2", launchOrFocusByBundleID("net.imput.helium"))
hs.hotkey.bind({"alt"}, "3", launchOrFocusByBundleID("com.apple.Safari"))
hs.hotkey.bind({"alt"}, "E", launchOrFocusByBundleID("com.sublimetext.4"))
hs.hotkey.bind({"alt"}, "T", launchOrFocusByBundleID(terminal))
hs.hotkey.bind({"alt"}, "F", launchOrFocusByBundleID("org.mozilla.librewolf"))
hs.hotkey.bind({"alt"}, "X", launchOrFocusByBundleID("com.apple.dt.Xcode"))
hs.hotkey.bind({"alt"}, "Z", launchOrFocusByBundleID("dev.zed.Zed"))
hs.hotkey.bind({"alt"}, "C", launchOrFocusByBundleID("com.microsoft.VSCode"))
hs.hotkey.bind({"alt"}, "V", launchOrFocusByBundleID("com.sublimemerge"))
hs.hotkey.bind({"alt"}, "M", launchOrFocusByBundleID("app.cyan.markedit"))
