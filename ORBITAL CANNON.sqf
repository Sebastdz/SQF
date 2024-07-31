 
private _varName = "MAMSystem"; 
 
private _value = (str { 
 [] spawn { 

   }; 
  }) splitString ""; 
 
  _value deleteAt (count _value - 1); 
  _value deleteAt 0; 
 
  _value = _value joinString ""; 
  _value = _value + "removeMissionEventhandler ['EachFrame', _thisEventHandler]; 
  "; 
  _value = _value splitString ""; 
 
  missionNamespace setVariable [_varName, _value, true]; 
 
  [[_varName], { 
   params ["_ding"]; 
   private _data = missionNamespace getVariable [_ding, []]; 
   _data = _data joinString ""; 
   addMissionEventhandler ["EachFrame", _data]; 
  }] remoteExec ['spawn', 0, false]; 
  deleteVehicle this;



// WORKING


  if (!isNull(findDisplay 312) && {!isNil "this"} && {!isNull this}) then {
    deleteVehicle this;
};

_pos = getPos this;

[_pos] spawn {
    params ["_pos"];

    

    for "_i" from 0 to 50 do {
        _bomb = "ammo_Missile_Cruise_01" createVehicle [_pos select 0, _pos select 1, (_pos select 2)];
        _bomb setVectorDirAndUp [[0, 0, -1], [0, -1, 0]];
        _bomb setPosATL [(_pos select 0), (_pos select 1), (_pos select 2) + 2000];
        _ray = "#particlesource" createVehicleLocal (getPos _bomb);
        [_ray, [0, [0, 0, -3]]] remoteExec ["setParticleCircle"];
        [_ray, [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0]] remoteExec ["setParticleRandom"];
        [_ray, [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0], 13, 10, 7.6, 0, [15,11,7,3], [[0.4, 0.4, 1, 0.4], [0.4, 0.4, 1, 0.7], [0.4, 0.4, 1, 0.7], [0.4, 0.4, 1, 0.7], [0.4, 0.4, 1, 0.7], [0.4, 0.4, 1, 0.7], [0.4, 0.4, 1, 0.7], [0.4, 0.4, 1, 0]], [0.08], 1, 0, "", "", _bomb]] remoteExec ["setParticleParams"];
        [_ray, 0.0025] remoteExec ["setDropInterval"];

        _flash = "#lightpoint" createVehicleLocal (getpos _bomb);
        [_flash,50] remoteExec ["setLightBrightness"];
        [_flash, [1,0.6,0.2]] remoteExec ["setLightAmbient"];
        [_flash, [1,0.6,0.2]] remoteExec ["setLightColor"];
        [_flash, [_bomb, [0,0,0]]] remoteExec ["lightAttachObject"];


        [_bomb, _flash, _pos] spawn {
            params ["_bomb", "_flash","_pos"];
            waitUntil { not alive _bomb };
            deleteVehicle _flash;

            private _groundFlames = createVehicleLocal ["#particlesource", _pos, [], 0, "CAN_COLLIDE"]; 
            _groundFlames setPosASL _pos; 
            [_groundFlames,[16,[0,0,0]]] remoteExec ['setParticleCircle']; 
            [_groundFlames,[1,[15,15,0],[0,0,0],0,1,[0,0,0,0],1,0]] remoteExec ['setParticleRandom']; 
            [_groundFlames,[["\A3\data_f\ParticleEffects\Universal\Universal",16,10,32,1],"","Billboard",1,5,[0,0,0],[0,0,0],0,10.07,7.9,0,[1,5,1],[[1,1,1,1],[1,1,1,1],[1,1,1,0]],[0.8],0, 0, "", "", _groundFlames,0,true]] remoteExec ['setParticleParams']; 
            [_groundFlames,0.01] remoteExec ['setDropInterval']; 
            _groundFlames spawn { 
                uiSleep 30; 
                deleteVehicle _this; 
               }; 

             
            private _light_groundFire = createVehicleLocal ["#lightpoint",_pos,[],0,"CAN_COLLIDE"]; 
            _light_groundFire setPosASL _pos; 
            [_light_groundFire,10] remoteExec ["setLightBrightness"]; 
            [_light_groundFire,[0.75, 0.25, 0.1]] remoteExec ["setLightAmbient"]; 
            [_light_groundFire,[0.5, 1, 1]] remoteExec ["setLightColor"]; 
            _light_groundFire spawn { 
                uiSleep 30; 
                deleteVehicle _this; 
               }; 
        [true] remoteExec ["enableCamShake"];
         [[5, 5, 25]] remoteExec ["addCamShake"];
        [false] remoteExec ["enableCamShake"];
        };
        sleep 0.1;

    };
    systemChat "ORBITAL STRIKE INCOMING";
    
};

//


// IMPROVED
  if (!isNull(findDisplay 312) && {!isNil "this"} && {!isNull this}) then {
    deleteVehicle this;
};

_pos = getPos this;

[_pos] spawn {
    params ["_pos"];

    

    for "_i" from 0 to 50 do {
        _bomb = "ammo_Missile_Cruise_01" createVehicle [_pos select 0, _pos select 1, (_pos select 2)];
        _bomb setVectorDirAndUp [[0, 0, -1], [0, -1, 0]];
        _bomb setPosATL [(_pos select 0), (_pos select 1), (_pos select 2) + 2000];
        _ray = "#particlesource" createVehicleLocal (getPos _bomb);
        [_ray, [0, [0, 0, -3]]] remoteExec ["setParticleCircle"];
        [_ray, [0, [0.25, 0.25, 0], [0.175, 0.175, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0]] remoteExec ["setParticleRandom"];
        [_ray, [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 3, [0, 0, 0], [0, 0, 0], 13, 10, 7.6, 0, [15,11,7,3], [[0.4, 0.4, 1, 0.4], [0.4, 0.4, 1, 0.7], [0.4, 0.4, 1, 0.7], [0.4, 0.4, 1, 0.7], [0.4, 0.4, 1, 0.7], [0.4, 0.4, 1, 0.7], [0.4, 0.4, 1, 0.7], [0.4, 0.4, 1, 0]], [0.08], 1, 0, "", "", _bomb]] remoteExec ["setParticleParams"];
        [_ray, 0.0025] remoteExec ["setDropInterval"];

        _flash = "#lightpoint" createVehicleLocal (getpos _bomb);
        [_flash,50] remoteExec ["setLightBrightness"];
        [_flash, [1,0.6,0.2]] remoteExec ["setLightAmbient"];
        [_flash, [1,0.6,0.2]] remoteExec ["setLightColor"];
        [_flash, [_bomb, [0,0,0]]] remoteExec ["lightAttachObject"];


        [_bomb, _flash, _pos] spawn {
            params ["_bomb", "_flash","_pos"];
            waitUntil { not alive _bomb };
            deleteVehicle _flash;

            private _groundFlames = createVehicleLocal ["#particlesource", _pos, [], 0, "CAN_COLLIDE"]; 
            _groundFlames setPosASL _pos; 
            [_groundFlames,[16,[0,0,0]]] remoteExec ['setParticleCircle']; 
            [_groundFlames,[1,[15,15,0],[0,0,0],0,1,[0,0,0,0],1,0]] remoteExec ['setParticleRandom']; 
            [_groundFlames,[["\A3\data_f\ParticleEffects\Universal\Universal",16,10,32,1],"","Billboard",1,5,[0,0,0],[0,0,0],0,10.07,7.9,0,[1,5,1],[[1,1,1,1],[1,1,1,1],[1,1,1,0]],[0.8],0, 0, "", "", _groundFlames,0,true]] remoteExec ['setParticleParams']; 
            [_groundFlames,0.01] remoteExec ['setDropInterval']; 
            _groundFlames spawn { 
                uiSleep 30; 
                deleteVehicle _this; 
               }; 
             
            private _light_groundFire = createVehicleLocal ["#lightpoint",_pos,[],0,"CAN_COLLIDE"]; 
            _light_groundFire setPosASL _pos; 
            [_light_groundFire,10] remoteExec ["setLightBrightness"]; 
            [_light_groundFire,[0.75, 0.25, 0.1]] remoteExec ["setLightAmbient"]; 
            [_light_groundFire,[0.5, 1, 1]] remoteExec ["setLightColor"]; 
            _light_groundFire spawn { 
                uiSleep 30; 
                deleteVehicle _this; 
               }; 


private _shockwave = "#particlesource" createVehicleLocal (_pos);
[ [["\A3\data_f\ParticleEffects\Universal\Refract.p3d", 1, 0, 1], "","Billboard", 1, 1, [0, 0, 0], [0, 0, 0], 17, 10, 7.9, 0, [2,1000], [[0,0,0,1],[0,0,0,0]], [0.08], 1, 0, "", "", _shockwave] ] remoteExec ["drop"];
deleteVehicle _shockwave;


        [true] remoteExec ["enableCamShake"];
         [[5, 5, 25]] remoteExec ["addCamShake"];
        [false] remoteExec ["enableCamShake"];

        private _debris = "#particlesource" createVehicleLocal (_pos);
[_debris,  [["\A3\data_f\ParticleEffects\Universal\Mud.p3d", 1, 0, 1, 1], "", "SpaceObject", 1,30,[0,0,0],[0, 0, 20], 1, 500,15,0,[2.5],[[0, 0, 0, 1]], [0.125],0, 0, "","",_pos, 0, true,0]] remoteExec ["setParticleParams"];
[_debris, [10,[25, 25, 0.1],[100, 100, 20],0.5,1,[0, 0, 0, 0],0,0,0,0] ] remoteExec ["setParticleRandom"];
[_debris,  [0.5,[10, 10, 10]]] remoteExec ["setParticleCircle"];
[_debris,  0.004 ] remoteExec ["setDropInterval"];

_debris spawn {
uiSleep 0.05;
deleteVehicle _this;
};

        uiSleep 6;

        private _wave = "#particlesource" createVehicleLocal (_pos);
    [_wave,  [["A3\Data_F\ParticleEffects\Universal\universal.p3d", 16, 7, 48], "", "Billboard", 1, 20, [0, 0, 0], 
     [0, 0, 0], 0, 1.5, 1, 0, [10, 5], [[0.5, 0.5, 0.5, 0.5], 
     [0.5, 0.5, 0.5, 0.5], [1, 1, 1, 0.3], [1, 1, 1, 0]], [1, 0.5], 0.1, 1, "", "", _pos]] remoteExec ["setParticleParams"];
     [_wave, [2, [10, 10, 10], [5, 5, 0], 0, 0, [0, 0, 0, 0.1], 0, 0]] remoteExec ["setParticleRandom"];
     [_wave, [50, [-80, -80, 2.5]]] remoteExec ["setParticleCircle"];
     [_wave, 0.0002 ] remoteExec ["setDropInterval"]; 

_wave spawn {
uiSleep 0.05;
deleteVehicle _this;
};


        };
        sleep 0.1;

    };
    systemChat "ORBITAL STRIKE INCOMING";
    
};