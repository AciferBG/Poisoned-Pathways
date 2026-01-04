function MoTargetCompare()
    local currentTarget = EEex_GameObject_Get(EEex_LuaTrigger_Object.m_targetId)
    local lastSeen = EEex_Object_ParseString("LastSeenBy(Myself)"):evalAsAIBase(EEex_LuaTrigger_Object)
    --if currentTarget == nil or lastSeen == nil then return false end
    --return EEex_UDEqual(currentTarget,lastSeen)
    if currentTarget == nil or lastSeen == nil then 
        return true
    elseif EEex_UDEqual(currentTarget,lastSeen) then
        return false
    else
        return true
    end
end