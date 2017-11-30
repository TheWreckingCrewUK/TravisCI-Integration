params ["_caller", "_target"];

_unCon = _target getVariable ["ace_medical_inReviveState", false];

if (_unCon) then {
	_reviveStartTime = _target getVariable ["ace_medical_reviveStartTime", 0];
	if (_reviveStartTime > 0) then {
		_timeToAdd = _reviveStartTime + 20;
		_bloodLoss = [_caller, _target] call twc_medical_fnc_getBloodLoss;
		
		if (_bloodLoss >= 0.8) then {
			_timeToAdd = _timeToAdd + (round (random [10, 25, 30]));
		};
		
		_target setVariable ["ace_medical_reviveStartTime", _timeToAdd min CBA_missionTime, true];
	};
};

_target getVariable "ace_medical_reviveStartTime";