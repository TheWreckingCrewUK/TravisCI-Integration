/*
* Author: [TWC] jayman
* Sets up TWC Defaults for patrol and makes it work for headless and vcom
*
* Arguments:
* 0: Unit <OBJECT>
* 1: POSITION <MARKER>
*
* Optional Parameters:
* 2: Radius <NUMBER>
* 3: Speed <STRING>
* 4: Formatin <STRING>
* 5: Behavior <STRING>
*
* Return Value:
* NOTHING
*
* Example:
* [unit1,"patrolMarker1",500,"LIMITED","COLUMN","AWARE"] call twc_fnc_patrol;
*
* Public: no
*/
params ["_unit","_marker",["_radius",500],["_speed","LIMITED"],["_formation","COLUMN"],["_behaviour","AWARE"]];

if (isServer || !hasInterface) then {
	[_unit,getmarkerpos _marker, _radius, 7, "MOVE", _behaviour, "YELLOW", _speed, _formation] call CBA_fnc_taskPatrol;
};
