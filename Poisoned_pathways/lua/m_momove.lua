MONearestEnemyObjects = {
    EEex_Object_ParseString("NearestEnemyOf(Myself)"),
    EEex_Object_ParseString("SecondNearestEnemyOf(Myself)"),
    EEex_Object_ParseString("ThirdNearestEnemyOf(Myself)"),
    EEex_Object_ParseString("FourthNearestEnemyOf(Myself)"),
    EEex_Object_ParseString("FifthNearestEnemyOf(Myself)"),
    EEex_Object_ParseString("SixthNearestEnemyOf(Myself)"),
}

MOMovingActions = {
    [22] = true, [23] = true 
}

function MOIsMoving(num)
    local nearestEnemy = MONearestEnemyObjects[num]:evalAsAIBase(EEex_LuaTrigger_Object)
    if nearestEnemy == nil then return false end
    return MOMovingActions[nearestEnemy.m_curAction.m_actionID]
end

--function MoCurrentTargetCasting()
--    if not EEex_GameObject_IsSprite(EEex_LuaTrigger_Object) then
--        return false
--    end
--    local currentTarget = EEex_GameObject_Get(EEex_LuaTrigger_Object.m_targetId)
--    return MOCastingActions[currentTarget.m_curAction.m_actionID]
--end