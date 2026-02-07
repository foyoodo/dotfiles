local gap = 5
local screen = hs.screen
local window = hs.window

local function centerIn(winFrame, frame)
    frame.x = (winFrame.x + (winFrame.w - frame.w) / 2) // 1
    frame.y = (winFrame.y + (winFrame.h - frame.h) / 2) // 1
    return frame
end

local function withWindow(apply)
    local mid = screen.mainScreen():frame()
    local win = window.focusedWindow()
    local f = win:frame()
    apply(mid, win, f)
end

local function setCenteredFrame(mid, win, f, instant)
    if instant then
        win:setFrame(centerIn(mid, f), 0)
    else
        win:setFrame(centerIn(mid, f))
    end
end

local function recenter(instant)
    withWindow(function(mid, win, f)
        setCenteredFrame(mid, win, f, instant)
    end)
end

local function centerAspect(d, w, h)
    return function()
        withWindow(function(mid, win, f)
            local p = (mid.h * d + h - 1) // h
            f.w = p * w
            f.h = p * h
            setCenteredFrame(mid, win, f, true)
        end)
    end
end

local function center(r)
    return function()
        withWindow(function(mid, win, f)
            f.w = ((mid.w - gap * 2) * r) // 1
            f.h = mid.h - gap * 2
            setCenteredFrame(mid, win, f, true)
        end)
    end
end

local function centerScale(dw, dh)
    return function()
        withWindow(function(mid, win, f)
            f.w = (mid.w * dw) // 1
            f.h = (mid.h * dh) // 1
            setCenteredFrame(mid, win, f, true)
        end)
    end
end

local function max()
    withWindow(function(mid, win)
        win:setFrame(mid, 0)
    end)
end

local function toggleFullScreen()
    local win = window.focusedWindow()
    win:setFullScreen(not win:isFullScreen())
end

local function centerAnimated()
    recenter(false)
end

local function centerAfter(transform)
    return function()
        transform()
        recenter(true)
    end
end

hs.hotkey.bind({"ctrl", "alt"}, "C", centerAnimated)
hs.hotkey.bind({"ctrl", "alt"}, "V", centerAfter(centerAspect(0.9, 16, 9)))
hs.hotkey.bind({"ctrl", "alt"}, "T", center(0.8))
hs.hotkey.bind({"ctrl", "alt"}, "F", centerAspect(0.9, 3, 2))
hs.hotkey.bind({"ctrl", "alt"}, "B", centerScale(0.6, 0.8))

hs.hotkey.bind({"ctrl", "alt"}, "return", max)

-- Override system keyboard shortcuts
hs.hotkey.bind({"ctrl", "cmd"}, "f", toggleFullScreen)
