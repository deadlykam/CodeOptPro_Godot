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
    - [Vars](#2-vars)
    - [Variable Creator](#variable-creator)
  - [Vector Performant Calculation](#vector-performant-calculation)
  - [Timer Countdown](#timer-countdown)
  - [Instantiate Object](#instantiate-object)
- [Versioning](#versioning)
- [Authors](#authors)
- [License](#license)

## Prerequisites
#### Godot Game Engine
Godot version **v4.1.1.stable.mono.official [bd6af8e0e]** and above should work. Previous version of Godot have not been tested and may give errors.
***
## Stable Build
[Stable-v1.0.0](https://github.com/deadlykam/CodeOptPro_Godot/tree/Stable-v1.0.0) is the latest stable build of the project. The compressed file for this project can also be found there. If development is going to be done on this project then it is adviced to branch off of any _Stable_ branches because they will **NOT** be changed or updated except for README.md. Any other branches are subjected to change including the main branch.
***
## Installation
1. First download the latest [CodeOptPro-v1.0.0.zip](https://github.com/deadlykam/CodeOptPro_Godot/releases/tag/v1.0.0) from the latest Stable build.
2. Once downloaded extract/unzip the file.
3. Enter the folder and copy the folder named **kamran_wali**.
4. Now paste the folder in the **addons** folder of your Godot project. If your Godot project does not have the **addons** folder then just create it in the root folder, **res://**, and paste the copied folder there.
5. (Optional) To open the interface for CodeOptPro simply go to the menu _Project_ -> _Projct Settings_. Click the _Plugins_ tab and enable the **Variable Creator**. This should open and dock the **Variable Creator**.
6. (Optional) If you want access to the CodeOptPro's script templates then go to the folder _addons_ -> _kamran_wali_ -> _code_opt_pro_ and copy then copy the folder named **script_templates**. Paste the copied folder in the root folder, res://. Now the script_templates should be available while inherting from Resource.
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

##### 2. Vars
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
I have added a new feature that allows to quickly add instantiation of packed scenes objects from the filesystem to the scene editor. No need to drag and drop or add an insantiated object 1 by 1 from the default Godot system. In future will try to make this system even faster. You can open the _Instantiate Object_ window by going to the menu _Project_ -> _Project Settings_ then select the _Plugins_ tab and finally enable the _Instantiate Object_. This will open the _Instantiate Object_ by docking it at the bottom right side. You dock it how ever you wish. Below I will explain the highlighted parts of the _Instantiate Object_.
| ![Instantiate-Object1.png](https://imgur.com/UYcB48h.png) | 
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
***
## Updates
Here I will share all the updates done to the current versions. Below are the updates.
1. Storing the provided manager in the _manager_helper_template_ by default. Before it was just a stub function.
2. Added timer countdown feature.
3. Added new Var types which are _Camera2D_, _Camera3D_, _Node_, _Node2D_ and _Node3D_.
4. Dynamic Path Default Setting - This means that if ever a new variable type is added then the Variable Creator will update the variable creation path location. It will change the path location to the default location for all certain variable type which is the _res://addons/kamran_wali/code_opt_pro/variables/_ folder. The reason for adding this feature is to avoid any errors while creating new variable type which is forgetting to add a new element in the path's array. So when a new variable type is added expect your saved path locations to change and you have to change and save them all back.
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
