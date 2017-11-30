/*	pre-reqs:
 *	- must be in a medical vehicle
 *	- must not be bleeding
 *	- requires the patient to have some blood (about two thirds of their blood level?)
 */
params ["_caller", "_target"];

if !(_target isKindOf "CAManBase") exitWith { false };
if (_caller == _target) exitwith { false };

// same uncon check as cpr
_unCon = [_target] call twc_medical_fnc_canCPR;
_inMedVehicle = [_caller] call ace_medical_fnc_isInMedicalVehicle;
_isBleeding = _target getVariable ["ace_medical_isBleeding", false];
_bloodVolume = [_caller, _target] call twc_medical_fnc_getBloodLoss; // i should change the name some time

// is in need of defibs
if (_unCon && _inMedVehicle && !(_isBleeding) && (_bloodVolume >= 0.8)) exitWith {
	true
};

false