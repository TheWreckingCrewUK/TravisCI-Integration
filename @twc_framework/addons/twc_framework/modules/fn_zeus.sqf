/*
* Author: [TWC] jayman
* Adds all units and objects to zeus continuously
*
* Arguments:
* 0: Enabled <BOOL>
*
* Return Value:
* NOTHING
*
* Example:
* [true] call twc_fnc_zeus;
*
* Public: No
*/
params ["_enabled"];

if(!isServer)exitWith{};

if !(_enabled) exitWith {};

//adds objects placed in editor:
{
	_x addCuratorEditableObjects [vehicles,true];
	_x addCuratorEditableObjects [(allMissionObjects "Man"),false];
	_x addCuratorEditableObjects [(allMissionObjects "Air"),true];
	_x addCuratorEditableObjects [(allMissionObjects "Ammo"),false];
}foreach allcurators;
	
//makes all units continuously available to Zeus (for respawning players and AI that's being spawned by a script.)
while {true} do {
			
			
				{
					_x addCuratorEditableObjects [allUnits, true];
					_x addCuratorEditableObjects [vehicles, true];
				}foreach allcurators;
	
	sleep 10;
};

if (true) exitWith {};