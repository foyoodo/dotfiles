local gap = 5

function central(win, frame)
    local f = frame
    f.x = (win.x + (win.w - f.w) / 2) // 1
    f.y = (win.y + (win.h - f.h) / 2) // 1
    return f
end

function centerAnimated()
    local mid = hs.screen.mainScreen():frame()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    win:setFrame(central(mid, f))
end

function centerAfter(transform)
    return function()
        transform()
        local mid = hs.screen.mainScreen():frame()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        win:setFrame(central(mid, f), 0)
    end
end

function centerAspect(d, w, h)
    return function()
        local mid = hs.screen.mainScreen():frame()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local p = (mid.h * d + h - 1) // h
        f.w = p * w
        f.h = p * h
        win:setFrame(central(mid, f), 0)
    end
end

function center(r)
    return function()
        local mid = hs.screen.mainScreen():frame()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        f.w = ((mid.w - gap * 2) * r) // 1
        f.h = mid.h - gap * 2
        win:setFrame(central(mid, f), 0)
    end
end

function centerScale(dw, dh)
    return function()
        local mid = hs.screen.mainScreen():frame()
        local win = hs.window.focusedWindow()
        local f = win:frame()
        f.w = (mid.w * dw) // 1
        f.h = (mid.h * dh) // 1
        win:setFrame(central(mid, f), 0)
    end
end

function max()
    local mid = hs.screen.mainScreen():frame()
    local win = hs.window.focusedWindow()
    win:setFrame(mid, 0)
end

function toggleFullScreen()
    local win = hs.window.focusedWindow()
    win:setFullScreen(not win:isFullScreen())
end

hs.hotkey.bind({"ctrl", "alt"}, "C", centerAnimated)
hs.hotkey.bind({"ctrl", "alt"}, "V", centerAfter(centerAspect(0.9, 16, 9)))
hs.hotkey.bind({"ctrl", "alt"}, "T", center(0.8))
hs.hotkey.bind({"ctrl", "alt"}, "F", centerAspect(0.9, 3, 2))
hs.hotkey.bind({"ctrl", "alt"}, "B", centerScale(0.6, 0.8))

hs.hotkey.bind({"ctrl", "alt"}, "return", max)

-- Override system keyboard shortcuts
hs.hotkey.bind({"ctrl", "cmd"}, "f", toggleFullScreen)
