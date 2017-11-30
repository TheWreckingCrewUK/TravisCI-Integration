/*
 * Bloodlust Compatability - insta kills a unit, if they meet the threshold
 * If a user has bloodlust, they should see the vaporization - otherwise, they'll just see a ragdoll
 */
// server only - server launches with bloodlust too
if (!isDedicated) exitWith {};

_TWC_VaporizedUnitCompat = {
	_unit = _this select 0;
	_damage = _this select 1;
	
	_isUnitVaporized = _unit getVariable ["BloodLust_IsVaporized", false];

	if (_isUnitVaporized) then {
		removeAllItems _unit;
		removeAllWeapons _unit;
		removeAllAssignedItems _unit;
		_unit removeWeaponGlobal "Binocular";
		_unit removeItems "ItemMap";
		
		[_unit, true, true] call ace_medical_fnc_setDead;
	};
};

BloodLust_OnUnitExplosionPostEventHandlers pushBack _TWC_VaporizedUnitCompat;