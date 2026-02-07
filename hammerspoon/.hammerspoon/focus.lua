function focus(bundleId)
    return function()
        hs.application.launchOrFocusByBundleID(bundleId)
    end
end

local terminal = "com.googlecode.iterm2" -- "com.apple.Terminal"

hs.hotkey.bind({"alt"}, "1", focus("com.apple.finder"))
hs.hotkey.bind({"alt"}, "2", focus("net.imput.helium"))
hs.hotkey.bind({"alt"}, "3", focus("com.apple.Safari"))
hs.hotkey.bind({"alt"}, "E", focus("com.sublimetext.4"))
hs.hotkey.bind({"alt"}, "T", focus(terminal))
hs.hotkey.bind({"alt"}, "F", focus("org.mozilla.librewolf"))
hs.hotkey.bind({"alt"}, "X", focus("com.apple.dt.Xcode"))
hs.hotkey.bind({"alt"}, "Z", focus("dev.zed.Zed"))
hs.hotkey.bind({"alt"}, "C", focus("com.microsoft.VSCode"))
hs.hotkey.bind({"alt"}, "V", focus("com.sublimemerge"))
hs.hotkey.bind({"alt"}, "M", focus("app.cyan.markedit"))
