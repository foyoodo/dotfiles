require "focus"
require "remag"

if not hspoonList then
    hspoonList = {
        "ReloadConfiguration",
    }
end

for _, v in pairs(hspoonList) do
    hs.loadSpoon(v)
end

spoon.ReloadConfiguration:start()
