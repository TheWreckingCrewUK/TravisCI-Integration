



_DeployRopes = ["pickupropes", "Deploy Ropes", "", {[] call SA_Take_Tow_Ropes_Action;}, {call SA_Take_Tow_Ropes_Action_Check}] call ace_interact_menu_fnc_createAction;
["TANK", 1, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToClass;