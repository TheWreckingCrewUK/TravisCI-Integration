
Params ["_Warrior"];
_allmags = magazines _Warrior;
_MagsWarrior = 0;
{
if (_x == "TWC_30mm_3rnd_AP") then {_MagsWarrior = _MagsWarrior + 1;};
if (_x == "TWC_30mm_3rnd_HE") then {_MagsWarrior = _MagsWarrior + 1;};
} foreach _allmags;

if (_MagsWarrior < 63) then {
	player removeitem "TWC_30mm_AP_item";
	_Warrior addMagazine "TWC_30mm_3rnd_AP";
}else{
Systemchat "There is no more ammunition room in the Warrior";
};
