[] spawn {
while {true} do {

if (zombie distance player >= 3) then
{
zombie doMove getPos player;
};

if (zombie distance player <= 3) then
{


zombie switchMove "AwopPercMstpSgthWpstDnon_Part3";
sleep 1;
zombie switchMove "";
};

sleep 1;
};
};


[] spawn {  
while {true} do {  
  
while {alive zombie}  
do { 
if (zombie distance player >= 3) then  
{  
zombie doMove getPos player;  
};  
  
if (zombie distance player <= 3) then  
{  
playSound3D ["a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg", zombie, false, getPosASL zombie, 1, 0.5, 0];
zombie switchMove "AwopPercMstpSgthWpstDnon_Part3";  
player SetDamage (damage player + 0.25);
sleep 1;  
zombie switchMove "";  
};  

sleep 1;  
}; 
};  
} [] remoteExec ["spawn", 0,zombie];






[] spawn {   
    _zombieTypes = [
                    "C_man_p_fugitive_F",
                    "C_man_polo_5_F",
                    "C_man_polo_6_F",
                    "C_man_polo_1_F",
                    "C_man_shorts_2_F",
                    "C_man_polo_4_F"
                    ];

 private _zombie = createVehicle[selectRandom _zombieTypes, this, [], 0, "NONE"];   

while {true} do {   
   
while {alive _zombie}   
do {  
if (_zombie distance player >= 3) then   
{   
_zombie doMove getPos player;   
};   
   
if (_zombie distance player <= 3) then   
{   

  _soundFiles = [
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg",
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_4.ogg",
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg",
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_2.ogg",
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg"
                ];

 _randomSound = _soundFiles select floor(random count _soundFiles);

playSound3D [_randomSound, _zombie, false, getPosASL _zombie, 1, 0.5, 0]; 
_zombie switchMove "AwopPercMstpSgthWpstDnon_Part3";   
player SetDamage (damage player + 0.25); 
sleep 1;   
_zombie switchMove "";   
};   
sleep 1;   
};  
};   
}; [_zombie,"AwopPercMstpSgthWpstDnon_Part3"] remoteExec ["switchMove",0, false];







// NEW




[this] spawn  {    
    params ["_logic"];
    _pos = getposatl _logic;
    _zombieTypes = [ 
                    "C_man_p_fugitive_F", 
                    "C_man_polo_5_F", 
                    "C_man_polo_6_F", 
                    "C_man_polo_1_F", 
                    "C_man_shorts_2_F", 
                    "C_man_polo_4_F" 
                    ]; 
 
 private _zombie = createVehicle[selectRandom _zombieTypes, _pos, [], 0, "NONE"];    
 
while {true} do {    
    
while {alive _zombie}    
do {   
if (_zombie distance player >= 3) then    
{    
_zombie doMove getPos player;    
};    
    
if (_zombie distance player <= 3) then    
{    
 
  _soundFiles = [ 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_4.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_2.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg" 
                ]; 
 
 _randomSound = _soundFiles select floor(random count _soundFiles); 
 
playSound3D [_randomSound, _zombie, false, getPosASL _zombie, 1, 0.5, 0];  
_zombie switchMove "AwopPercMstpSgthWpstDnon_Part3";    
player SetDamage (damage player + 0.25);  
sleep 1;    
_zombie switchMove "";    
};    
sleep 1;    
};   
};    
}; [_zombie,"AwopPercMstpSgthWpstDnon_Part3"] remoteExec ["switchMove",0, false];












// [] spawn { 
// while {true} do { 
 
// class CfgSounds { 
//     sounds[] = {}; 
 
//     class screaminge_3 { 
//         name = "Screaming E 3"; 
//         sound[] = {"a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_3.ogg", 1, 1, 100}; 
//         titles[] = {0, "*Screaming sound*"}; 
//     }; 
// };

// if (zombie distance player >= 3) then 
// { 
// zombie doMove getPos player; 
// }; 
 
// if (zombie distance player <= 3) then 
// { 
// zombie say "screaminge_3";
// zombie switchMove "AwopPercMstpSgthWpstDnon_Part3"; 
// sleep 1; 
// zombie switchMove ""; 
// }; 
 
// sleep 1; 
// }; 
// } 









// NEAREST OBJECTS
 [this] spawn {
    params ["_logic"];
    
    _pos = getPosATL _logic;
    _zombieTypes = [
        "C_man_p_fugitive_F",
        "C_man_polo_5_F",
        "C_man_polo_6_F",
        "C_man_polo_1_F",
        "C_man_shorts_2_F",
        "C_man_polo_4_F"
    ];

    private _zombie = createVehicle [selectRandom _zombieTypes, _pos, [], 0, "NONE"];
    

    while {alive _zombie} do {
        _nearestPlayers = nearestObjects [_zombie, ["Man"], 10, false];

        if (count _nearestPlayers > 0) then {
            _nearestPlayer = _nearestPlayers select 0;

            if (_zombie distance _nearestPlayer >= 3) then {
                _zombie doMove getPos _nearestPlayer;
            };

            if (_zombie distance _nearestPlayer <= 3) then {
                 
                 _soundFiles = [ 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_4.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_2.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg" 
                ]; 

                _randomSound = _soundFiles select floor(random count _soundFiles);

                playSound3D [_randomSound, _zombie, false, getPosASL _zombie, 1, 0.5, 0];
                _zombie switchMove "AwopPercMstpSgthWpstDnon_Part3";
                _nearestPlayer setDamage (damage _nearestPlayer + 0.25);
                sleep 1;
                _zombie switchMove "";
            };
        };

        sleep 1;
    };
};








[this] spawn  {    
    params ["_logic"];
    _pos = getposatl _logic;
    _zombieTypes = [ 
                    "C_man_p_fugitive_F", 
                    "C_man_polo_5_F", 
                    "C_man_polo_6_F", 
                    "C_man_polo_1_F", 
                    "C_man_polo_2_F",
                    "C_man_polo_4_F",
                    "C_man_polo_6_F",
                    "C_man_shorts_3_F", 
                    "C_Man_Fisherman_01_F", 
                    "C_Man_casual_1_F", 
                    "C_Man_casual_2_F", 
                    "C_Man_casual_3_F", 
                    "C_Man_casual_4_F", 
                    "C_Man_casual_5_F", 
                    "C_man_sport_1_F", 
                    "C_man_sport_2_F", 
                    "C_man_sport_3_F"
                    ]; 
 

 private _zombieGroup = createGroup EAST;
private _zombie = _zombieGroup createUnit [selectRandom _zombieTypes, _pos, [], 0, "NONE"];

private _curatorlogic = getAssignedCuratorLogic Player;
_curatorlogic addCuratorEditableObjects [[_zombie], true];

[_zombie] joinSilent (createGroup EAST); 

deleteVehicle _logic;

 _zombie switchMove "";    

    
while {alive _zombie}    
do {   

_zombie setBehaviour "CARELESS";

_nearestPlayers = nearestObjects [_zombie, ["CAManBase"], 200] select {alive _x and _x != _zombie};

_nonZombie = _nearestPlayers select {side _x != side _zombie};

 _nearestPlayer = _nonZombie select 0;


if (_zombie distance _nearestPlayer <= 50) then    
{    
_zombie doMove getPos _nearestPlayer;    
     _soundFilesCharge = [ 
                    " ", 
                    " ", 
                    " ", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_4.ogg", 
                    " ", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg", 
                    " ", 
                    " ", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_2.ogg", 
                    " ", 
                    " ", 
                    " ", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg"
                ]; 
    
     _randomSoundCharge = _soundFilesCharge select floor(random count _soundFilesCharge);   
    playSound3D [_randomSoundCharge, _zombie, false, getPosASL _zombie, 1, 0.4, 0];  
};    
    
if (_zombie distance  _nearestPlayer < 4) then    
{    
 _zombie doMove getPos _nearestPlayer;    
  _soundFiles = [ 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_4.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_2.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg" 
                ]; 
 
 _randomSound = _soundFiles select floor(random count _soundFiles); 
 
_zombie doWatch _nearestPlayer;
sleep 0.5;
playSound3D [_randomSound, _zombie, false, getPosASL _zombie, 1, 0.5, 0];  
[_zombie,"AwopPercMstpSgthWpstDnon_Part3"] remoteExec ["switchMove",0,false];
 _nearestPlayer SetDamage (damage  _nearestPlayer + 0.20);  
sleep 1.2;    
[_zombie,""] remoteExec ["switchMove",0,false];
};    
sleep 1;    
};   
};










// TARGET ONLY PLAYER
[this] spawn  {    
    params ["_logic"];
    _pos = getposatl _logic;
   _zombieTypes = [ 
                    "C_man_p_fugitive_F", 
                    "C_man_polo_5_F", 
                    "C_man_polo_6_F", 
                    "C_man_polo_1_F", 
                    "C_man_polo_2_F",
                    "C_man_polo_4_F",
                    "C_man_polo_6_F",
                    "C_man_shorts_3_F", 
                    "C_Man_Fisherman_01_F", 
                    "C_Man_casual_1_F", 
                    "C_Man_casual_2_F", 
                    "C_Man_casual_3_F", 
                    "C_Man_casual_4_F", 
                    "C_Man_casual_5_F", 
                    "C_man_sport_1_F", 
                    "C_man_sport_2_F", 
                    "C_man_sport_3_F"
                    ]; 
 

 private _zombieGroup = createGroup EAST;
private _zombie = _zombieGroup createUnit [selectRandom _zombieTypes, _pos, [], 0, "NONE"];

private _curatorlogic = getAssignedCuratorLogic Player;
_curatorlogic addCuratorEditableObjects [[_zombie], true];

[_zombie] joinSilent (createGroup EAST); 

deleteVehicle _logic;

 _zombie switchMove "";    

    
while {alive _zombie}    
do {   

_zombie setBehaviour "CARELESS";

_nearestPlayers = nearestObjects [_zombie, ["CAManBase"], 200] select {alive _x and isPlayer _x};

 _nearestPlayer = _nearestPlayers select 0;


if (_zombie distance _nearestPlayer <= 250) then    
{    
_zombie doMove getPos _nearestPlayer;    
     _soundFilesCharge = [ 
                    " ", 
                    " ", 
                    " ", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_4.ogg", 
                    " ", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg", 
                    " ", 
                    " ", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_2.ogg", 
                    " ", 
                    " ", 
                    " ", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg"
                ]; 
    
     _randomSoundCharge = _soundFilesCharge select floor(random count _soundFilesCharge);   
    playSound3D [_randomSoundCharge, _zombie, false, getPosASL _zombie, 1, 0.4, 0];  
};    
    
if (_zombie distance  _nearestPlayer < 4) then    
{    
 _zombie doMove getPos _nearestPlayer;    
  _soundFiles = [ 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_4.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_2.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg" 
                ]; 
 
 _randomSound = _soundFiles select floor(random count _soundFiles); 
 
_zombie doWatch _nearestPlayer;
sleep 0.5;
playSound3D [_randomSound, _zombie, false, getPosASL _zombie, 1, 0.5, 0];  
[_zombie,"AwopPercMstpSgthWpstDnon_Part3"] remoteExec ["switchMove",0,false];
 _nearestPlayer SetDamage (damage  _nearestPlayer + 0.20);  
sleep 1.2;    
[_zombie,""] remoteExec ["switchMove",0,false];
};    
sleep 1;    
};   
};









// hint format ["%1",_nearestPlayer];










[this] spawn  {    
    params ["_logic"];
    _pos = getposatl _logic;
    _zombieTypes = [ 
                    "C_man_p_fugitive_F", 
                    "C_man_polo_5_F", 
                    "C_man_polo_6_F", 
                    "C_man_polo_1_F", 
                    "C_man_shorts_2_F", 
                    "C_man_polo_4_F" 
                    ]; 
 
 private _zombie = createVehicle[selectRandom _zombieTypes, _pos, [], 0, "NONE"];    

 
while {alive _zombie}    
do {   
  

  
_nearestPlayers = nearestObjects [_zombie, ["CAManBase"], 200] select {alive _x and _x != _zombie};
 _nearestPlayer = _nearestPlayers select 0;


_zombie doMove getPos _nearestPlayer;    

hint format ["Zombie position: %1", getPos _zombie];
Sleep 1;
hint format ["Nearest player: %1", getPos _nearestPlayer];


sleep 1;    
};   
}; 





// TODO: GUNSHOT

[this] spawn  {    
    params ["_logic"];
    _pos = getposatl _logic;
    _zombieTypes = [ 
                    "C_man_p_fugitive_F", 
                    "C_man_polo_5_F", 
                    "C_man_polo_6_F", 
                    "C_man_polo_1_F", 
                     "C_man_polo_4_F",
                    "C_man_shorts_3_F", 
                    "C_Man_Fisherman_01_F", 
                    "C_Man_casual_4_F", 
                    "C_Man_casual_5_F", 
                    "C_man_sport_1_F", 
                    "C_man_sport_3_F"
                    ]; 
 

 private _zombieGroup = createGroup EAST;
private _zombie = _zombieGroup createUnit [selectRandom _zombieTypes, _pos, [], 0, "NONE"];

private _curatorlogic = getAssignedCuratorLogic Player;
_curatorlogic addCuratorEditableObjects [[_zombie], true];

[_zombie] joinSilent (createGroup EAST); 

deleteVehicle _logic;

 _zombie switchMove "";    

    
while {alive _zombie}    
do {   

_zombie setBehaviour "CARELESS";

_nearestPlayers = nearestObjects [_zombie, ["CAManBase"], 200] select {alive _x and _x != _zombie};

_nonZombie = _nearestPlayers select {side _x != side _zombie};

_zombie addEventHandler ["Fired", {
    params ["_zombie", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

    hint "Gunshot detected!";
}];

 _nearestPlayer = _nonZombie select 0;

if (_zombie distance _nearestPlayer <= 50) then    
{    
_zombie doMove getPos _nearestPlayer;    
};    
    
if (_zombie distance  _nearestPlayer < 4) then    
{    
 _zombie doMove getPos _nearestPlayer;    
  _soundFiles = [ 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_4.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_2.ogg", 
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg" 
                ]; 
 
 _randomSound = _soundFiles select floor(random count _soundFiles); 
 
_zombie doWatch _nearestPlayer;
sleep 0.5;
playSound3D [_randomSound, _zombie, false, getPosASL _zombie, 1, 0.5, 0];  
[_zombie,"AwopPercMstpSgthWpstDnon_Part3"] remoteExec ["switchMove",0,false];
 _nearestPlayer SetDamage (damage  _nearestPlayer + 0.25);  
sleep 1.2;    
[_zombie,""] remoteExec ["switchMove",0,false];
};    
sleep 1;    
};   
};




// COPY 

[this] spawn  {     
    params ["_logic"]; 
    _pos = getposatl _logic; 
    _zombieTypes = [  
                    "C_man_p_fugitive_F",  
                    "C_man_polo_5_F",  
                    "C_man_polo_6_F",  
                    "C_man_polo_1_F",  
                     "C_man_polo_4_F", 
                    "C_man_shorts_3_F",  
                    "C_Man_Fisherman_01_F",  
                    "C_Man_casual_4_F",  
                    "C_Man_casual_5_F",  
                    "C_man_sport_1_F",  
                    "C_man_sport_3_F" 
                    ];  
  
 
 private _zombieGroup = createGroup EAST; 
private _zombie = _zombieGroup createUnit [selectRandom _zombieTypes, _pos, [], 0, "NONE"]; 
 
private _curatorlogic = getAssignedCuratorLogic Player; 
_curatorlogic addCuratorEditableObjects [[_zombie], true]; 
 
[_zombie] joinSilent (createGroup EAST);  
 
deleteVehicle _logic; 
 
 _zombie switchMove "";     
 
     
while {alive _zombie}     
do {    
 
_zombie setBehaviour "CARELESS"; 
 
_nearestPlayers = nearestObjects [_zombie, ["CAManBase"], 200] select {alive _x and _x != _zombie}; 
 
_nonZombie = _nearestPlayers select {side _x != side _zombie}; 
 
 
 _nearestPlayer = _nonZombie select 0; 
 
 
if (_zombie distance _nearestPlayer <= 50) then     
{     
_zombie doMove getPos _nearestPlayer;     
};     
     
if (_zombie distance  _nearestPlayer < 4) then     
{     
 _zombie doMove getPos _nearestPlayer;     
  _soundFiles = [  
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg",  
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_4.ogg",  
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg",  
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_2.ogg",  
                    "a3\dubbing_radio_f\data\eng\male01eng\radioprotocoleng\combat\200_combatshouts\screaminge_1.ogg"  
                ];  
  
 _randomSound = _soundFiles select floor(random count _soundFiles);  
  
_zombie doWatch _nearestPlayer; 
sleep 0.5; 
playSound3D [_randomSound, _zombie, false, getPosASL _zombie, 1, 0.5, 0];   
[_zombie,"AwopPercMstpSgthWpstDnon_Part3"] remoteExec ["switchMove",0,false]; 
 _nearestPlayer SetDamage (damage  _nearestPlayer + 0.20);   
sleep 1.2;     
[_zombie,""] remoteExec ["switchMove",0,false]; 
};     
sleep 1;     
};    
};

 
