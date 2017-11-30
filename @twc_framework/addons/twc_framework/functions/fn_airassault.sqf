/*
/ Required parameters
/ 0 - Spawn Marker
/ 1 - Location that the helicopter will drop the troops
/ 2 - Location that the troops will move to after being dropped off
/ 
/ Additional Parameters
/ 3 - Era that Troops\helicopter will be, standard is russian, default:"Modern" Options:"Modern","Cold",Custom
/ 4 - Only if Custom ERA: Class Name of Helicopter  
/ 5 - Only if Custom ERA: Config classname of Group
*/
if (isServer) then {
	params ["_spawnmarker", "_dropmarker", "_movemarker", ["_ERA", "Modern"], ["_helicopterType", ""], ["_infantryType", ""]];
	_pos = [0,0,0];
	if(typeName _spawnmarker == "STRING")then{_pos = getMarkerPos _spawnmarker};
	if(typeName _spawnmarker == "ARRAY")then{_pos = _spawnmarker};

	if (_Era == "Modern") then {
		// _helicopterType = "CUP_O_Mi8_RU"; // attempted to rename
		// _infantryType = (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_squad");
	};

	if (_Era == "Cold") then {
		_helicopterType = "BCCCCP_Mi8T";
		_infantryType = (configfile >> "CfgGroups" >> "EAST" >> "BCCCCP" >> "BBC" >> "Dismounted_Section");
	};

	if (_Era == "Custom") then {};

	_helipadSpawn =  "HeliHEmpty" createVehicle getMarkerPos _dropMarker;
	_helicopterPilots = createGroup east; 
	_helicopterVehicle = [_pos, 180, _helicopterType, _helicopterPilots] call BIS_fnc_spawnVehicle;
	_infantryGroup = [_pos, east, _infantryType] call BIS_fnc_spawnGroup; 
	_helicopterMCargo = _helicopterVehicle select 0;

	{
		_x moveInCargo _helicopterMCargo;
	} foreach (units _infantryGroup); 

	_moveToUnloadLocation = _helicopterPilots addWaypoint [getMarkerPos _dropMarker, 1]; 
	[_helicopterPilots, 1] setWaypointType "TR UNLOAD";

	_infantryGetOutLocation = _infantryGroup addWaypoint [getMarkerPos _dropmarker, 1];
	[_infantryGroup, 1] setWaypointType "GETOUT";

	_infantryMoveLocation = _infantryGroup addWaypoint [getMarkerPos _moveMarker, 2]; 
	[_infantryGroup, 2] setWaypointType "MOVE";
};
