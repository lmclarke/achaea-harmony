Harmony.raid = {}
Harmony.raid.following = false
Harmony.raid.leader = nil
Harmony.raid.leading = false

function Harmony.raid.toggleFollowing()
    if Harmony.raid.following then
        Harmony.say("No longer following a leader.")
        Harmony.raid.leader = nil
    else
        Harmony.say("Now listening for a raid leader.")
    end

    Harmony.raid.following = not Harmony.raid.following

    raiseEvent("Harmony.raid.followingUpdated", target)
end

function Harmony.raid.setLeader(name)
    if not Harmony.raid.following then
        return
    end
    Harmony.raid.leader = name
    Harmony.say(("Raid leader is now <green>%s<reset>"):format(name))
end

function Harmony.raid.toggleLeading()
    if Harmony.raid.leading then
        Harmony.announce("I'm no longer calling targets.")
    else
        Harmony.announce("I am calling targets, focus your fire on my command.")
    end

    Harmony.raid.leading = not Harmony.raid.leading
    raiseEvent("Harmony.raid.leadingUpdated", target)
end