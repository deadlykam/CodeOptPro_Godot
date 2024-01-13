<p align="center"><img src="https://imgur.com/vupUkm8.png"></p>

# CodeOptPro

### Introduction
This is a simple Godot system that helps with performance.

## Table of Contents:
- [Prerequisites](#prerequisites)
- [Stable Build](#stable-build)
- [Installation](#installation)
- [Features](#features)
  - [Performant Data Share/Use](#performant-data-shareuse)
    - [Fixed Vars](#1-fixed-vars)
    - [Managers](#2-managers)
    - [Vars](#3-vars)
    - [Variable Creator](#variable-creator)
  - [Vector Performant Calculation](#vector-performant-calculation)
  - [Timer Countdown](#timer-countdown)
  - [Instantiate Object](#instantiate-object)
  - [Bars](#bars)
  - [Performant Update](#performant-update)
    -  [Update Manager Runtime Functions/Methods](#update-manager-runtime-functionsmethods)
    -  [Auto Setup Objects](#auto-setup-objects)
- [Updates](#updates)
- [Versioning](#versioning)
- [Authors](#authors)
- [License](#license)

## Prerequisites
#### Godot Game Engine
Godot version **v4.1.3.stable.mono.official [f06b6836a]** and above should work. Previous Godot version of **v4.1.1.stable.mono.official [bd6af8e0e]** should work but any version before that have not been tested and may give errors.
***
## Stable Build
[Stable-v1.8.0](https://github.com/deadlykam/CodeOptPro_Godot/tree/Stable-v1.8.0) is the latest stable build of the project. The compressed file for this project can also be found there. If development is going to be done on this project then it is adviced to branch off of any _Stable_ branches because they will **NOT** be changed or updated except for README.md. Any other branches are subjected to change including the main branch.
***
## Installation
1. First download the latest [CodeOptPro-v1.8.0.zip](https://github.com/deadlykam/CodeOptPro_Godot/releases/tag/v1.8.0) from the latest Stable build.
2. Once downloaded extract/unzip the file.
3. Enter the folder and copy the folder named **kamran_wali**.
4. Now paste the folder in the **addons** folder of your Godot project. If your Godot project does not have the **addons** folder then just create it in the root folder, **res://**, and paste the copied folder there.
5. (Optional) To open the interface for CodeOptPro simply go to the menu _Project_ -> _Projct Settings_. Click the _Plugins_ tab and enable the **Variable Creator** or **Instantiate Object**. This should open and dock the **Variable Creator** or **Instantiate Object**.
7. (Optional) If you want access to the CodeOptPro's script templates then go to the folder _addons_ -> _kamran_wali_ -> _code_opt_pro_ and copy then copy the folder named **script_templates**. Paste the copied folder in the root folder, res://. Now the script_templates should be available while inherting from Resource.
***
## Features
#### Performant Data Share/Use:
I have also added a feature that allows to share/use data in a performant way by extending the **Resource** script. For now there are two categories of data share and each have their own different data types.
##### 1. Fixed Vars
In this category different type of data types are shared, example bool, float, int, string etc. You only need to create one fixed var and share it with multiple objects, example - If five objects needs an int value of 1 then create a fixed var of type int that has the value 1 and share that. In that way only one int value of 1 is created instead of five which saves some memory. Like the name suggests the values are fixed and can/should **NOT** be updated. Otherwise it defeats the purpose of its function. Only call the _get_value()_ function to get the value and do **NOT** change the property **_value** through script.
- **COP_FixedBoolVar** - This FixedVar type shares _bool_ data types. When creating the COP_FixedBoolVar set the value either true or false by clicking the tick box. To get the value simply call the method _bool COP_FixedBoolVar.get_value()_. To use COP_FixedBoolVar simply change the type of a var to COP_FixedBoolVar.
- **COP_FixedFloatVar** - This FixedVar type shares _float_ data types. When creating the COP_FixedFloatVar set the value to any float type value. To get the value simply call the method _float COP_FixedFloatVar.get_value()_. To use COP_FixedFloatVar simply change the type of a var to COP_FixedFloatVar.
- **COP_FixedIntVar** - This FixedVar type shares _int_ data types. When creating the COP_FixedIntVar set the value to any int type value. To get the value simply call the method _int COP_FixedIntVar.get_value()_. To use COP_FixedIntVar simply change the type of a var to COP_FixedIntVar.
- **COP_FixedStringVar** - This FixedVar type shares _string_ data types. When creating the COP_FixedStringVar set the value to any string type value. To get the value simply call the method _string COP_FixedStringVar.get_value()_. To use COP_FixedStringVar simply change the type of a var to COP_FixedStringVar.
- **COP_FixedVector2Var** - This FixedVar type shares _Vector2_ data types. When creating the COP_FixedVector2Var set the value to any Vector2 type value. To get the value simply call the method _Vector2 COP_FixedVector2Var.get_value()_. To use COP_FixedVector2Var simply change the type of a var to COP_FixedVector2Var.
- **COP_FixedVector3Var** - This FixedVar type shares _Vector3_ data types. When creating the COP_FixedVector3Var set the value to any Vector3 type value. To get the value simply call the method _Vector3 COP_FixedVector3Var.get_value()_. To use COP_FixedVector3Var simply change the type of a var to COP_FixedVector3Var.
- **COP_FixedVar Template** - For creating a new COP_FixedVar type you can simply use the script templates that are already present in the addon. Go to the folder _addons_ -> _kamran_wali_ -> _code_opt_pro_ and then copy the folder **script_templates**. Paste the copied folder to the root folder **res://**. Now you can use the script template to create a new COP_FixedVar. Just create a new script and make sure to _Inherit_ from _Resource_. Then in the _Template_ section select **Resource: Fixed Var Template**. Give the script any name you want and finally create it. Now in the script make sure to give it a class name if you want to which has been commented out. For the value change it to any type you want. Finally for the **get_value()** method make sure to give it a return type as well which may help with performance a bit.

##### 2. Managers
This category shares different type of managers instead of data types. Managers are scripts that have a bit of complex logic to it and these manager resources helps to share the references to those managers in a decoupled way. In this case unfortunately _Variable Creator_ will only create managers that are created in _CodeOptPro_ but if you want to create your own custom manager then you can use the _manager_helper_template_ which is under the Resources while creating a script. The manager that is going to be referenced MUST be the only one that calls the method _set_manager(manager) void_ and provides _self_ as reference. Other scripts using this manager helper resource reference MUST only call the method _get_manager()_ and then use the manager's methods from there. You can check out the script [cop_update_manager_global_helper](https://github.com/deadlykam/CodeOptPro_Godot/blob/98f9f276ef7cc5a25555bc95e77be0b654b5e081/addons/kamran_wali/code_opt_pro/scripts/resources/managers/cop_update_manager_global_helper.gd) to see how the manager resource script is created.
- **COP_UpdateManagerGlobalHelper** - This manager reference type stores and uses the reference for global update managers and global update objects.

##### 3. Vars
Just like FixedVars this category shares different type of data types as well, example bool, float, int, string etc. The only difference is that you can **NOT** set any values here like FixedVars and the values may change through custom scripts. Vars basically share values that are constantly changing. For example - You have 5 objects that wants to know the player's position. Then just create a COP_Vector3Var and make the player script constantly update the newly created Vector3Var. Then add the newly created Vector3Var to the other 5 objects. Now all of those 5 objects have access to the player's position without the need of player script reference. Also use the functions _get_value()_ and _set_value(type)_ for getting and setting the value. Do **NOT** get or set the property **_value** directly through script as this may result in error later on. Below are all the types.
- **COP_BoolVar** - This Var type shares _bool_ data types. To set the value simply call _void COP_BoolVar.set_value(bool value)_. To get the value just call _bool COP_BoolVar.get_value()_. To use COP_BoolVar simply change the type of a var to COP_BoolVar.
- **COP_Camera2DVar** - This Var type shares _Camera2D_ data types. To set the value simply call _void COP_Camera2DVar.set_value(Camera2D value)_. To get the value just call _Camera2D COP_Camera2DVar.get_value()_. To use COP_Camera2DVar simply change the type of a var to COP_Camera2DVar.
- **COP_Camera3DVar** - This Var type shares _Camera3D_ data types. To set the value simply call _void COP_Camera3DVar.set_value(Camera3D value)_. To get the value just call _Camera3D COP_Camera3DVar.get_value()_. To use COP_Camera3DVar simply change the type of a var to COP_Camera3DVar.
- **COP_FloatVar** - This Var type shares _float_ data types. To set the value simply call _void COP_FloatVar.set_value(float value)_. To get the value just call _float COP_FloatVar.get_value()_. To use COP_FloatVar simply change the type of a var to COP_FloatVar.
- **COP_IntVar** - This Var type shares _int_ data types. To set the value simply call _void COP_IntVar.set_value(int value)_. To get the value just call _int COP_IntVar.get_value()_. To use COP_IntVar simply change the type of a var to COP_IntVar.
- **COP_NodeVar** - This Var type shares _Node_ data types. To set the value simply call _void COP_NodeVar.set_value(Node value)_. To get the value just call _Node COP_NodeVar.get_value()_. To use COP_NodeVar simply change the type of a var to COP_NodeVar.
- **COP_Node2DVar** - This Var type shares _Node2D_ data types. To set the value simply call _void COP_Node2DVar.set_value(Node2D value)_. To get the value just call _Node2D COP_Node2DVar.get_value()_. To use COP_Node2DVar simply change the type of a var to COP_Node2DVar.
- **COP_Node3DVar** - This Var type shares _Node3D_ data types. To set the value simply call _void COP_Node3DVar.set_value(Node3D value)_. To get the value just call _Node3D COP_Node3DVar.get_value()_. To use COP_Node3DVar simply change the type of a var to COP_Node3DVar.
- **COP_StringVar** - This Var type shares _string_ data types. To set the value simply call _void COP_StringVar.set_value(string value)_. To get the value just call _string COP_StringVar.get_value()_. To use COP_StringVar simply change the type of a var to COP_StringVar.
- **COP_Vector2Var** - This Var type shares _Vector2_ data types. To set the value simply call _void COP_Vector2Var.set_value(Vector2 value)_. To get the value just call _Vector2 COP_Vector2Var.get_value()_. To use COP_Vector2Var simply change the type of a var to COP_Vector2Var.
- **COP_Vector3Var** - This Var type shares _Vector3_ data types. To set the value simply call _void COP_Vector3Var.set_value(Vector3 value)_. To get the value just call _Vector3 COP_Vector3Var.get_value()_. To use COP_Vector3Var simply change the type of a var to COP_Vector3Var.
- **COP_Var Template** - Fir creating a new COP_Var type you can simply use the script templates that are already present in the addon. Go to the folder _addons_ -> _kamran_wali_ -> _code_opt_pro_ and then copy the folder **script_templates**. Paste the copied folder to the root folder **res://**. Now you can use the script template to create a new COP_Var. Just create a new script and make sure to _Inherit_ from _Resource_. Then in the _Template_ section select **Resource: Var Template**. Give the script any name you want and finally create it. Now in the script make sure to give it a class name if you want to which has been commented out. For the value change it to any type you want. For the **get_value()** method make sure to give it a return type as well which may help with performance a bit. Finally for the **set_value(value)** give the parameter a type as well for helping with performance.

##### Variable Creator
For now the only way to create a new variable is to use the _Variable Creator_ plugin. You can open the _Variable Creator_ window by going to the menu _Project_ -> _Project Settings_ then select the _Plugins_ tab and finally enable the _Variable Creator_. This will open the _Variable Creator_ by docking it at the bottom right side. You can dock it how ever you wish. Below I will explain the highlighted parts of the _Variable Creator_.

| ![Variable-Creator1.png](https://imgur.com/yQQdTDU.png) | 
|:--:| 
| *Variable Creator* |

- **a.** _Name_ - This is where you give the name of the variable you want to create. If name given already exists in the path then the newly created variable will replace the old one and it does not matter what type it was.
- **b.** _Path_ - This is the path or folder location where the new variable will be created. You can update this path as well. Foll the instructions in _c._ to see how to update the path.
- **c.** _Update Path_ - If you want to update the path where the new variable will be created then right click the folder where the variable should be created and select _Copy Path_. Paste the copied path in the path field, _b._. Finally press the _Update Path_ button and the path will be updated. This will only update the path for 1 variable type, in this case _FixedBoolVar_ types. This way the _Variable Creator_ will allow you to have different paths for different variable types. The default path is _res://addons/kamran_wali/code_opt_pro/variables/_.
- **d.** _Category_ - This is where you get to select from which category the variable will be created. For now there are 2 categories which are _FixedVars_ and _Vars_.
- **e.** _Variable Type_ - This is where you get to select which type of variable to create. Each category have different type of variable types.
- **f.** _Create Variable_ - This button will create the new variable type. Remember to give a name to the variable otherwise this button will **NOT** be visible. Also the name of the button _Create Variable_ will change with the variable type selected so that you will know what type you are creating.

#### Vector Performant Calculation:
I have also added performant Vector calculations that may save some performance issue in the long runespecially when it comes to Vector distance calculation. The class is called _Vec_ and it contains static functions. I will give just brief explanation of the functions.
1. _float Vec.distance_vec3(Vector3, Vector3)_ - This method calculates the distance between two Vector3s and the returned value is a squared value. This means that if you want to check if the distance of the two vector point is greater/less than 5 units then you must make 5 squared which is simply 5x5 = 25. Meaning you are comparing against 25. This will save lot of performance issue later down the line when too many objects needs distance check.
2. _float Vec.distance_fixed_vec3_var(COP_FixedVector3Var, COP_FixedVector3Var)_ - This method is similar to 1. so please read that discription for explanation. Only difference is that it takes two COP_FixedVector3Vars.
3. _flaot Vec.distance_vec3_var(COP_Vector3Var, COP_Vector3Var)_ - This method is similar to 1. so please read that discription for explanation. Only difference is that it takes two COP_Vector3Vars.
4. _float Vec.distance_vec2(Vector2, Vector2)_ - This method is similar to 1. so please read that discription for explanation. Only difference is that it takes two Vector2s.
5. _float Vec.distance_fixed_vec3_var(COP_FixedVector2Var, COP_FixedVector2Var)_ - This method is similar to 1. so please read that discription for explanation. Only difference is that it takes two COP_FixedVector2Vars.
6. _float Vec.distance_vec2_var(COP_Vector2Var, COP_Vector2Var)_ - This method is similar to 1. so please read that discription for explanation. Only difference is that it takes two COP_Vector2Vars.
7. _Vector3 Vec.subtract_vec3(Vector3, Vector3)_ - This method subtracts two Vector3 without needing any extra _var_ variable and returns a Vector3 value.
8. _Vector3 Vec.subtract_fixed_vec3_var(COP_FixedVector3Var, COP_FixedVector3Var)_ - This method is similar to 7. so please read that discription for explanation. The only difference is that it takes two COP_FixedVector3Vars.
9. _Vector3 Vec.subtract_vec3_var(COP_Vector3Var, COP_Vector3Var)_ - This method is similar to 7. so please read that discription for explanation. The only difference is that it takes two COP_Vector3Vars.
10. _Vector2 Vec.subtract_vec2(Vector2, Vector3)_ - This method subtracts two Vector2 without needing any extra _var_ variable and returns a Vector2 value.
11. _Vector2 Vec.subtract_fixed_vec2_var(COP_FixedVector2Var, COP_FixedVector2Var)_ - This method is similar to 10. so please read that discription for explanation. The only difference is that it takes two COP_FixedVector2Vars.
12. _Vector2 Vec.subtract_vec2_var(COP_Vector2Var, COP_Vector2Var)_ - This method is similar to 10. so please read that discription for explanation. The only difference is that it takes two COP_Vector2Vars.
13. _Vector3 Vec.add_vec3(Vector3, Vector3)_ - This method adds two Vector3s without needing any extra _var_ variable and returns a Vector3 value.
14. _Vector3 Vec.add_fixed_vec3_var(COP_FixedVector3Var, COP_FixedVector3Var)_ - This method is similar to 13. so please read that discription for explanation. The only difference is that it takes two COP_FixedVector3Vars.
15. _Vector3 Vec.add_vec3_var(COP_Vector3Var, COP_Vector3Var)_ - This method is similar to 13. so please read that discription for explanation. The only difference is that it takes two COP_Vector3Vars.
16. _Vector2 Vec.add_vec2(Vector2, Vector2)_ - This method adds two Vector2s without needing any extra _var_ variable and returns a Vector2 value.
17. _Vector2 Vec.add_fixed_vec2_var(COP_FixedVector2Var, COP_FixedVector2Var)_ - This method is similar to 16. so please read that discription for explanation. The only difference is that it takes two COP_FixedVector2Var.
18. _Vector2 Vec.add_vec2_var(COP_Vector2Var, COP_Vector2Var)_ - This method is similar to 16. so please read that discription for explanation. The only difference is that it takes two COP_Vector2Var.
19. _Vector3 Vec.divide_vec3(Vector3, float)_ -> This method divides the Vector3 value with the float value without needing any extra _var_ variable and returns a Vector3.
20. _Vector3 Vec.divide_fixed_vec3_var(COP_FixedVector3Var, float)_ - This method is similar to 19. so please read that discription for explanation. The only difference is that it takes COP_FixedVector3Var.
21. _Vector3 Vec.divide_vec3_var(COP_Vector3Var, float)_ - This method is similar to 19. so please read that discription for explanation. The only difference is that it takes COP_Vector3Var.
22. _Vector2 Vec.divide_vec2(Vector2, float)_ - This method divides the Vector2 value with the float value without needing any extra _var_ variable and returns a Vector2.
23. _Vector2 Vec.divide_fixed_vec2_var(COP_FixedVector2Var, float)_ - This method is similar to 22. so please read that discription for explanation. The only difference is that it takes COP_FixedVector2Var.
24. _Vector2 Vec.divide_vec2_var(COP_Vector2Var, float)_ - This method is similar to 22. so please read that discription for explanation. The only difference is that it takes COP_Vector2Var.
25. _Vector3 Vec.multiply_vec3(Vector3, float)_ - This method multiplys the Vector3 value with the float value without needing any extra _var_ variable and returns a Vector3.
26. _Vector3 Vec.multiply_fixed_vec3_var(COP_FixedVector3Var, float)_ - This method is similar to 25. so please read that discription for explanation. The only difference is that it takes COP_FixedVector3Var.
27. _Vector3 Vec.multiply_vec3_var(COP_Vector3Var, float)_ - This method is similar to 25. so please read that discription for explanation. The only difference is that it takes COP_Vector3Var.
28. _Vector2 Vec.multiply_vec2(Vector2, float)_ - This method multiplys the Vector2 value with the float value without needing any extra _var_ variable and returns a Vector2.
29. _Vector2 Vec.multiply_fixed_vec2_var(COP_FixedVector2Var, float)_ - This method is similar to 28. so please read that discription for explanation. The only difference is that it takes COP_FixedVector2Var.
30. _Vector2 Vec.multiply_vec2_var(COP_Vector2Var, float)_ - This method is similar to 28. so please read that discription for explanation. The only difference is that it takes COP_Vector2Var.
31. _Vector3 Vec.set_vec3(Vector3, float, float, float)_ - This method sets the target Vector3 axis values with the provided float values. It then returns the Vector3 without needing any extra _var_ variables.
32. _Vector2 Vec.set_vec2(Vector2, float, float, float)_ - This method sets the target Vector2 axis values with the provided float values. It then returns the Vector2 without needing any extra _var_ variables.

#### [Timer Countdown](https://github.com/deadlykam/CodeOptPro_Godot/blob/b79a2330ca62ab07de849c523add2b76f91374fe/addons/kamran_wali/code_opt_pro/scripts/timers/timer_countdown.gd):
Even though Godot has a [Countdown Timer](https://docs.godotengine.org/en/stable/classes/class_timer.html) there are certain functionality that are missing which would help a lot. So I added a Timer Countdown feature. The script does as the name suggests which is it count downs to 0. This timer also calculates the normal value for the count down which may help later to sync up some other logic or features of yours.

To use the Timer Countdown feature you must first add a Node and then add the script called **timer_countdown.gd** or **timer_countdown_time.gd**. Both are same but the only difference is that for **timer_countdown.gd** you need to provide the time through script where as for **timer_countdown_time.gd** you can provide the time as _COP_FixedFloatVar_ in the inspector. For the example below we will be using **timer_countdown_time.gd**. You can either drag and drop the script from _addons -> kamran_wali -> code_opt_pro -> scripts -> timers -> timer_countdown_time.gd_ or click the drop down button under the Script tab and select Quick Load and then just type **timer_countdown_time** to get it. Once you have added the Timer Countdown then you must provide a **COP_FixedFloatVar** resource to the field _Time Seconds_ which must have a value greater than 0.0. The value provided here are in seconds. Now in your main script create an export var with type COP_BaseTimer.
```
SomeScript.gd
extends Node
@export var timer: COP_BaseTimer
```
Finally you must call the **timer_countdown_time.update_timer(float)** function to start the timer countdown. This function can be called in either **_process(delta)** or **_physics_process(delta)**. Also the delta value must be provided. If you multiply the delta value with more than 1 then the countdown will happen faster than 1 second and if you multiply the delta value with less than 1 then the countdown will happen slower than 1 second. Example:
For _process(delta)
```
SomeScript.gd
extends Node
@export var timer: COP_BaseTimer

func _ready() -> void:
  timer.reset_timer() # Resetting the timer at start

func _process(delta) -> void:
  if !timer.is_timer_done: # Checking if timer is NOT done only then will update the timer
    timer.update_timer(delta) # If only delta is passed then the countdown will be every 1 second. Any value else will be multiple of it.
```

For _physics_process(delta)
```
SomeScript.gd
extends Node
@export var timer: COP_BaseTimer

func _ready() -> void:
  timer.reset_timer() # Resetting the timer at start

func _physics_process(delta) -> void:
  if !timer.is_timer_done: # Checking if timer is NOT done only then will update the timer
    timer.update_timer(delta) # If only delta is passed then the countdown will be every 1 second. Any value else will be multiple of it.
```
I will briefly explain what each of the method does in **base_timer.gd** which is the blue-print for all timer scritps:
1. **void set_time(float)** - This method sets a new time second for the timer and overrides the provided time in the export.
2. **bool is_timer_done()** - This method checks if the timer is done counting down.
3. **float normalized()** - This method gets the normalized value of the timer which is within the range of 0.0 to 1.0.
4. **float get_current_time_seconds()** - This method gets the current countdown time of the timer.
5. **void reset_timer()** - This method resets the timer for countdown.
6. **void stop_timer()** - This method stops the timer countdown.
7. **float get_time_seconds()** - This method gets the max time or the set time for the timer.
8. **void update_timer(float)** - This method updates the timer countdown.

#### Instantiate Object:
I have added a new feature that allows to quickly add instantiation of packed scenes objects from the filesystem to the scene editor. No need to drag and drop or add an insantiated object 1 by 1 from the default Godot system. In future will try to make this system even faster. You can open the _Instantiate Object_ window by going to the menu _Project_ -> _Project Settings_ then select the _Plugins_ tab and finally enable the _Instantiate Object_. This will open the _Instantiate Object_ by docking it at the bottom right side. You can dock it how ever you wish. Below I will explain the highlighted parts of the _Instantiate Object_.
| ![Instantiate-Object1.png](https://imgur.com/cJ5jIAA.png) | 
|:--:| 
| *Instantiate Object* |

- **a.** _Scene_ - This is the scene or packed scene you need to select from the FileSystem. This is also the object that will be instantiated into the Scene Editor.
- **b.** _Scene Status_ - This is the status of the selected scene object. It will tell you if you have selected a scene or packed scene object from the filesystem or not. When selecting a correct scene or packed scene from the filesystem then the status' font will turn green and show the name of the object indicating that a correct object has been selected.
- **c.** _Lock Scene_ - If enabled this will make sure that the current selected scene does not get overriden when any other filesystem objects are selected. This helps to navigate through the filesystem without worrying about getting the selected filesystem object overriden.
- **d.** _Parent_ - This is the node object where the selected scene or packed scene will be instantiated into as a child. This node object must be selected in the Scene Editor.
- **e.** _Parent Status_ - This is the status of the selected parent node object. It will tell you if you have selected a parent node from the Scene Editor or not. When selecting a correct node object from the Scene Editor then the status' font will turn green and show the name of the object indicating that a correct object has been selected.
- **f.** _Lock Parent_ - If enabled this will make sure that the current selected node does not get overriden when any other Scene Editor objects are selected. This helps to navigate through the Scene Editor without worrying about getting the selected parent object overriden.
- **g.** _Number of Instantiation_ - This will instantiate _n_ number of objects. _n_ being greater than 1. This feature is optional and does NOT need to be populated to work.
- **h.** _Instantiate Object_ - This button will instantiate an object. If a value is given in _Number of Instantiation_ then it will instantiate that amount of objects. This button will ONLY appear if a correct _Scene_ and _Parent_ objects are selected.

#### Bars:
Added bar feature which acts like any normal bar. This can, for example, be used for character health. The _get_normal()_ method in the bar is a powerful function that allows you to sync the bar with any other features. Below I will briefly explain what each method does.
1. **void set_max(int)** - This method sets the maximum limit for the bar. The max limit can NOT be less than 1. If a value of less than 1 is given the bar will make the max limit to 1. If this method needs to be called then calling it once when the scene is ready is recommended. This will make sure to avoid any wrong results. _Also make sure that this method is called before set_current(int) method. Otherwise setup might give wrong results._
2. **void set_current(int)** - This method sets the current value of the bar. The current value can NOT be less than 0 or more than max value. If a value of less than 0 is given then the current value will be set to 0. If a value of more than max is given then the current value will be set to max value. If this method needs to be called then calling it once when the scene is ready is recommended. This will make sure to avoid any wrong results. _Also make sure that this method is called after set_max(int) method. Otherwise setup might give wrong results._
3. **float get_normal()** - This method gets the normal value for the bar which is in the range of 0 to 1. You can use this value to sync other features with the bar.
4. **void add(int)** - This method adds value to the bar's current value. The current value of the bar will never go above maximum value.
5. **int get_value_max()** - This method gets the maximum value of the bar.
6. **int get_value_current()** - This method gets the current value of the bar.
7. **bool is_full()** - This method checks if the bar is full that is current value equals to max value.
8. **bool is_depleted()** - This method checks if the bar is empty that is current value equals to 0.
9. **void restore()** - This method makes the bar full again that is current value equals to max value.
10. **void subtract(int)** - This method removes value from the bar's current value. The current value of the bar will never go below 0.

I have added different type of bars with different functionalities. I will explain how to use them briefly below.
1. **normal_bar** - This bar acts like a normal bar which means that adding a value will just add the value and subtracting a value will just subtract it. To use this bar make sure to set the maximum value at the scene start otherwise the default value will be used as maximum which is 1. Optionally you can set the current value as well if you want to at the scene start otherwise its value will be 0.
```
SomeScript.gd

extends Node
@export var bar: COP_BaseBar

func _ready() -> void:
  bar.set_max(10)
  bar.set_current(10) # Optional: If you also want to set the current value at the start but it is NOT necessary if NOT needed

## This method hurts the character with the given value.
func hurt(value: int) -> void:
  bar.subtract(value) # Removing health by subtracting bar's current value

## This method heals the character with the given value.
func heal(value: int) -> void:
  bar.add(value) # Adding health by adding to bar's current value

## This method checks if the character is dead or NOT.
func is_dead() -> bool:
  return is_depleted()

## This method returns the health's normal value so that the UI bar can be synced.
func get_health_normal() -> float:
  return bar.get_normal() # The health's normal value which is the bar's normal value
```

2. **normal_bar_values** - This bar is same as the **normal_bar** in functionalities. The only difference is that you must provide the max and current value in the script itself. It has two properties which are **_max: COP_FixedFloatVar** and **_is_set_cur_value: COP_FixedBoolVar**. The **_max** property takes in a _COP_FixedFloatVar_ value which is the maximum limit for the bar and the value MUST be greater than 1. The **_is_set_cur_value** property takes in a _COP_FixedBoolVar_ value which is the flag that decides if to set the current value of the bar as max value or NOT. True means the current value at the start will be same as the max value. False means current value will be 0 at the start. You don't need to call the _set_max(int)_ and _set_current(int)_ methods at the start but you do have the option to do so if you want to. You can use the code example in **1. normal_bar** and just remove **func _ready()** method from it.

#### Performant Update:
In CodeOptPro you can use another powerful feature that allows you to use custom update to update your script, that is the __process(delta)_ and __physics_process(delta)_. This custom update allows you to share one __process(delta)_ or __physics_process(delta)_ method with many scripts. This in turn saves lot of performance issues as one script is handling the call for processes. There are two types of custom update classes in CodeOptPro they are _COP_UpdateManager_ and _COP_UpdateManagerGlobalHelper_. Each of these custom update classes have 2 more types which are _process_manager_local_ and _physics_process_manager_local_ for the _COP_UpdateManager_. And _process_manager_global_ and _physics_process_manager_global_ for the _COP_UpdateManagerGlobalHelper_. The main logic between all of them are same but the only difference is that the local ones needs to be referenced in coupled way while the global ones are referenced in a decoupled way. Below I will explain how to use the custom update manager.

1. **Adding The Update Manager** - The first task you need to do is to add at least one update manager in the scene. This could be added any where but it is best to add all update managers under one Node called _UpdateManagers_ so that it remains organized and easy to debug. So create a new Node called _UpdateManager1_ and add any of the update manager scripts called _physics_process_manager_global_, _process_manager_global_, _physics_process_manager_local_ or _process_manager_local_. Now let me explain the properties of the update manager.
  - a. **Helper (Only available in the global types)** - This the _cop_update_manager_global_helper_ resource that helps to keep the code decoupled. The update objects will use this reference to interact with the update manager. This property is only available for the global types. There is already a _cop_update_manager_global_helper_ resource created called _default_update_manager_. You can use this as well for your project if you want to.
  - b. **Objects** - This is an array which will contain all the update objects related to this update manager. These objects will share one __physics_process_ or __process_ method from the update manager. You can manually add the update objects here but that is NOT recommended. Instead we shall use the _Auto Setup_ plugin to add update objects to update managers automatically. Will talk about how to create an update object and using _Auto Setup_ plugin later below.
  - c. **Num Update** - This value handles how many objects should be updated per frame. For example if this value is set to 5 then 5 objects will be update in one frame cycle. It there are too many update objects that needs to be updated then increasing thsi value should make the update process much better but that depends on your scripts and their logic.
  - d. **Is Set Num Update** - If set true then will automatically set the _Num Update_ value to the number of objects added to the update manager. If null or false then the _Num Update_ value will be used and auto setup for _Num Update_ won't work. For example if there are 5 objects added and the _Num Update_ value is and _Is Set Num Update_ value is true then the actual num update value will be 5. _Note: This value can remain null as null is taken as a false flag here._
2. **Creating And Adding Update Object** - The second step is to create an update object. It is very easy to create an update object. If you haven't copied the folder _script_templates_ to the main folder _res://_ then do that now as we will needed the update object template to create our scripts. Once that is done then create a new script. In the _Inherits:_ field select _Node_. Then in the _Template:_ field either select _Cop Update Object Global Tepmlate_, if you have added the global update manager, or select _Cop Update Object Local Template_, if you have added the local update manager. Name the script anything you want and then press _Create_ button. I have commented the script with much details but I will explain what each of these properties and functions does.
    - a. **update_manager (COP_UpdateManagerGlobalHelper or COP_UpdateManager)** - This property keeps the reference of the update manager. Depending on what type you used it could be either _COP_UpdateManagerGlobalHeler_, for global update objects, or _COP_UpdateManager_, for local update objects. This reference is mainly used by the _Auto Setup_ plugin to add the update object automatically to the update managers but can also be used for using any data from the update manager.
    - b. **update(float) void** - This is the method that will update the update object every frame. So any update logic that you were going to put in either __physics_process_ or __process_ should be put in here.
    - c. **set_active(bool) void** - This method enables/disables the update object. So if any flags that are going to be used for activation check must be able to be updated by this function.
    - d. **is_active() bool** - This method checks if the update object is active or NOT. If it is NOT active then the update manager will NOT call it's _update(float)_ method. Again use a separate flag that will be used to check for activation.

The last two methods can be ignored and should NEVER be called by any script or overridden. These are used by the _Auto Setup_ plugin for automation. I have commented extensively here to avoid any errors. Also you can change the extension of the script to anything else you want but as long as the object is a child of Node then it will be fine. Below is an example script of a global update object called _update_object1.gd_.
```
@tool
extends Node

## The global update manager that will update this object.
@export var update_manager: COP_UpdateManagerGlobalHelper:
	set(p_update_manager):
		if update_manager != p_update_manager:
			update_manager = p_update_manager
			update_configuration_warnings()

@export var _counter:= 0
@export var _is_active:= true

func _get_configuration_warnings():
	var warnings = []

	if !update_manager:
		warnings.append("Update Manager: Please assign a COP_UpdateManagerGlobalHelper 
			otherwise object will NOT be updated and auto setup will give error.")
	
	return warnings

## This method updates the update object.
func update(delta: float) -> void:
	_counter += 1
	print("Counter: ", _counter)
	pass

## This method activates/deactivates the update object.
func set_active(is_enable: bool) -> void:
	_is_active = is_enable

## This method checks if the update object is active or NOT.
func is_active() -> bool:
	return _is_active

#region The logic in this section MUST NOT BE CHANGED OR OVERRIDDEN!
## This method adds this object to the update manager._action_options
## THIS METHOD SHOULD NOT BE CALLED OR OVERRIDDEN. IT IS ONLY USED
## FOR AUTOMATION!
func _add_self_to_manager():
	if update_manager:
		update_manager._add_object(self)
	else:
		push_error("Error: ", name, " does not have update manager assigned!")

## This method always sends true as the script is an update object.
## This method is needed for duck typing check and SHOULD NOT BE
## OVERRIDDEN OR CHANGED!
func _is_update_object():
	return true
#endregion
```
When this script runs it will just show the value of the counter going up. Create a new Node in the example scene and attach this script to it.
3. **Auto Setup** - The final step is to use the _Auto Setup_ plugin to setup the update managers and update objects. Enable the _Auto Setup_ plugin from the _Plugins_ tabs in the _Project Settings_.
| ![Variable-Creator1.png](https://imgur.com/kT1co7u.png) | 
|:--:| 
| *Auto Setup* |

- a. **Run Project** - This will run the auto setup and then play the project which is the main scene.
- b. **Run Current Scene** - This will run the auto setup and then play the edited scene which is the currently active scene.
- c. **Manual Setup** - This will only run auto setup.
- d. **Log** - Here the logs will be shown for the auto setup process.
- e. **Auto Save (Current Scene)** - If enabled then the current scene will be automatically saved once the auto setup process is done. It is recommended to keep it enabled so that if you forget to save the scene then this will do the saving for you.

Before using the _Auto Setup_ plugin we must first setup the update managers and the update objects. If you have used local update manager then there is nothing needed to setup the update manager but if you have used global update manager then you must set the _Helper_. You can either select or drag and drop the _default_update_manager_, which is found in this path _res://addons/kamran_wali/code_opt_pro/variables/_, or you can create a new _cop_update_manager_global_ through the [Variable Creator](#variable-creator). In this example we will use the default one if global update manager is used. Now we need to setup the update object. Select the update object. If local update object is used then drag and drop the update manager into the _Update Manager_ field in the update object. If global update object is used then either select the _defaul_update_manager_ or the one you created. Finally make sure the _Is Active_ flag is true.

Alright. We done setting up the update manager and update objects. Now in the _Auto Setup_ plugin press the _Run Current Scene_ button. If everything is alright then this should start the auto setup process and then run the scene. Once the scene runs you will see the _Counter_ value going up in the _Output_. You will also notice in the _Auto Setup_ plugin that the _Log_ has been updated showing all the process of the auto setup.

##### Update Manager Runtime Functions/Methods:
I have also added some runtime methods for the update manager. This will help tremendously during runtime of the game. Below are the methods:
- **void add_object(Node):** This method adds a new object to the update manager. _Also please do NOT confuse this method with the private method **_add_object(Node)** as this private method does NOT handle some of the validation checks and is ONLY used by the automation script._ If you don't want any duplicate objects added then make sure to check using the method **bool COP_UpdateManager.has_object(Node)** before calling the add_object(Node) method. Below is a small example of avoiding duplicate object addition when adding object to update manager.
```
extends Node

@export var update_manager: COP_UpdateManager

func some_method(object: Node) -> void:
	if !update_manager.has_object(object): # Checking if the object does NOT exist in the Update Manager
		update_manager.add_object(object)
```
- **void remove_object(Node):** This method removes the given object. _Note: When calling this method the update method will stop working till all remove actions are done. If number of remove objects are small then the update pause won't be noticable. It is recommended NOT to call this method every frame_
- **void remove_object_index(int):** This method removes an object using an int index value. _Note: When calling this method the update method will stop working till all remove actions are done. If number of remove objects are small then the update pause won't be noticable. It is recommended NOT to call this method every frame_
- **int get_size():** This method gets the number of objects added to the update manager.

##### Auto Setup Objects:
This feature allows objects to be setup automatically during the auto setup process in the editor mode. This helps with certain tasks like automatically populating an array with objects. If you haven't copied the folder _script_templates_ to the main folder _res://_ then do that now as that contains the script template for _auto setup object_ called _COP_auto_setup_object_template.gd_ under _Node_. To declare an object as _auto setup object_ is easy. You can create a new script using the script template _COP_auto_setup_object_template.gd_ or add the methods _func auto_setup() -> void:_ and _func _is_auto_setup_object() -> bool:_ and _@tool_ to an existing script. The _auto setup object_ can extend from any other script as long as that script is a child of _Node_ object. These two methods will make the script an _auto setup object_. Let me explain what each me method does.
- **void auto_setup():** This method is called during the auto setup process and this is where all the logic for auto setup should be placed.
- **bool _is_auto_setup_object():** This method is used by the auto setup process to check if the object is an auto setup object. This method MUST NOT be changed or overridden.
Below I am sharing a very simple code on how to use the _auto setup object_. This code just populates the Arrya[Node] with children from a Node.
```
@tool
extends Node

@export var _object_holder: Node
@export var _some_objects: Array[Node]

var _index: int

## This method handles all the setup that needs to be done during 
## automation setup process.
func auto_setup() -> void:
	_some_objects.clear() # Making sure every auto setup process the array is cleared so no duplication occurs
	_index = 0
	while _index < _object_holder.get_child_count(): # Loop for populating the array from the given Node
		_some_objects.append(_object_holder.get_child(_index))
		_index += 1

#region The logic in this section MUST NOT BE CHANGED OR OVERRIDDEN!
## This method always sends true as the script is an auto setup object.
## This method is needed for duck typing check and SHOULD NOT BE
## OVERRIDDEN OR CHANGED!
func _is_auto_setup_object() -> bool:
    return true
#endregion
```
If you want to you can also make any _update objects_ to be _auto setup objects_ as well just by adding the methods _void func auto_setup()_ and _bool _is_auto_setup_object()_ to the _update object_ script. That way the object will be both _update object_ and _auto setup object_.
***
## Updates
Here I will share all the updates done to the current versions. Below are the updates.
1. Added runtime functions for the update manager. Now the user can add and remove objects during runtime.
2. Added a feature in update manager that makes the _Num Update_ value to the number of objects added to the update manager.
3. Fixed a bug where __time_delta_ value wasn't calculated properly.
4. Added _auto setup object_ feature. This feature allows setup to happen during the auto setup process in the editor mode.
***
## Versioning
The project uses [Semantic Versioning](https://semver.org/). Available versions can be seen in [tags on this repository](https://github.com/deadlykam/CodeOptPro_Godot/tags).
***
## Authors
- Syed Shaiyan Kamran Waliullah 
  - [Kamran Wali Github](https://github.com/deadlykam)
  - [Kamran Wali Twitter](https://twitter.com/KamranWaliDev)
  - [Kamran Wali Youtube](https://www.youtube.com/channel/UCkm-BgvswLViigPWrMo8pjg)
  - [Kamran Wali Website](https://deadlykam.github.io/)
***
## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details.
***
