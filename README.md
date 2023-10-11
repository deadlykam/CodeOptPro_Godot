<p align="center"><img src="https://imgur.com/vupUkm8.png"></p>

# CodeOptPro

### Introduction
This is a simple Godot system that helps with performance.

## Table of Contents:

## Prerequisites
#### Godot Game Engine
Godot version **v4.1.1.stable.mono.official [bd6af8e0e]** and above should work. Previous version of Godot have not been tested and may give errors.
***
## Stable Build
[Stable-v1.0.0]() is the latest stable build of the project. The compressed file for this project can also be found there. If development is going to be done on this project then it is adviced to branch off off any _Stable_ branches because they will **NOT** be changed or updated except for README.md. Any other branches are subjected to change including the main branch.
***
## Installation
1. First download the latest [CodeOptPro-v1.0.0.zip]() from the latest Stable build.
2. Once downloaded extract/unzip the file.
3. Enter the folder and copy the folder named **kamran_wali**.
4. Now paste the folder in the **addons** folder of your Godot project. If your Godot project does not have the **addons** folder then just create it in the root folder, **res://**, and paste the copied folder there.
5. (Optional) To open the interface for CodeOptPro simply go to the menu _Project_ -> _Projct Settings_. Click the _Plugins_ tab and enable the **Variable Creator**. This should open and dock the **Variable Creator**.
6. (Optional) If you want access to the CodeOptPro's script templates then go to the folder _addons_
***
## Features
#### Performant Data Share/Use:
I have also added a feature that allows to share/use data in a performant way by extending the **Resource** script. For now there are two categories of data share and each have their own different data types.
##### 1. Fixed Vars
In this category different type of data types are shared, example bool, float, int, string etc. You only need to create one fixed var and share it with multiple objects, example - If five objects needs an int value of 1 then create a fixed var of type int that has the value 1 and share that. In that way only one int value of 1 is created instead of five which saves some memory. Like the name suggests the values are fixed and can/should **NOT** be updated. Otherwise it defeats the purpose of its function. Only call the _get_value_ function to get the value and do **NOT** change the property **_value** through script.
- **COP_FixedBoolVar** - This FixedVar type shares _bool_ data types. When creating the COP_FixedBoolVar set the value either true or false by clicking the tick box. To get the value simply call the method _bool COP_FixedBoolVar.get_value()_. To use COP_FixedBoolVar simply change the type of a var to COP_FixedBoolVar.
- **COP_FixedFloatVar** - This FixedVar type shares _float_ data types. When creating the COP_FixedFloatVar set the value to any float type value. To get the value simply call the method _float COP_FixedFloatVar.get_value()_. To use COP_FixedFloatVar simply change the type of a var to COP_FixedFloatVar.
- **COP_FixedIntVar** - This FixedVar type shares _int_ data types. When creating the COP_FixedIntVar set the value to any int type value. To get the value simply call the method _int COP_FixedIntVar.get_value()_. To use COP_FixedIntVar simply change the type of a var to COP_FixedIntVar.
- **COP_FixedStringVar** - This FixedVar type shares _string_ data types. When creating the COP_FixedStringVar set the value to any string type value. To get the value simply call the method _string COP_FixedStringVar.get_value()_. To use COP_FixedStringVar simply change the type of a var to COP_FixedStringVar.
- **COP_FixedVector2Var** - This FixedVar type shares _Vector2_ data types. When creating the COP_FixedVector2Var set the value to any Vector2 type value. To get the value simply call the method _Vector2 COP_FixedVector2Var.get_value()_. To use COP_FixedVector2Var simply change the type of a var to COP_FixedVector2Var.
- **COP_FixedVector3Var** - This FixedVar type shares _Vector3_ data types. When creating the COP_FixedVector3Var set the value to any Vector3 type value. To get the value simply call the method _Vector3 COP_FixedVector3Var.get_value()_. To use COP_FixedVector3Var simply change the type of a var to COP_FixedVector3Var.
- **COP_FixedVar Template** - For creating a new COP_FixedVar type you can simply use the script templates that are already present in the addon. Go to the folder _addons_ -> _kamran_wali_ -> _code_opt_pro_ and then copy the folder **script_templates**. Paste the copied folder to the root folder **res://**. Now you can use the script template to create a new COP_FixedVar. Just create a new script and make sure to _Inherit_ from _Resource_. Then in the _Template_ section select **Resource: Fixed Var Template**. Give the script any name you want and finally create it. Now in the script make sure to give it a class name if you want to which has been commented out. For the value change it to any type you want. Finally for the **get_value()** method make sure to give it a return type as well which may help with performance a bit.

##### 2. Vars
Just like FixedVars this category shres different type of data types as well, example bool, float, int, string etc. The only difference is that you can **NOT** set any values here like FixedVars and the values may change through custom scripts. Vars basically share values that are constantly changing. For example - You have 5 objects that wants to know the player's position. Then just create a COP_Vector3Var and make the player script constantly update the newly created Vector3Var. Then add the newly created Vector3Var to the other 5 objects. Now all of those 5 objects have access to the player's position without the need of player script reference. Also use the functions _get_value()_ and _set_value(type)_ for getting and setting the value. Do **NOT** get or set the property **_value** directly through script as this may result in error later on. Below are all the types.
- **COP_BoolVar** - This Var type shares _bool_ data types. To set the value simply call _void COP_BoolVar.set_value(bool value)_. To get the value just call _bool COP_BoolVar.get_value()_. To use COP_BoolVar simply change the type of a var to COP_BoolVar.
- **COP_FloatVar** - This Var type shares _float_ data types. To set the value simply call _void COP_FloatVar.set_value(float value)_. To get the value just call _float COP_FloatVar.get_value()_. To use COP_FloatVar simply change the type of a var to COP_FloatVar.
- **COP_IntVar** - This Var type shares _int_ data types. To set the value simply call _void COP_IntVar.set_value(int value)_. To get the value just call _int COP_IntVar.get_value()_. To use COP_IntVar simply change the type of a var to COP_IntVar.
- **COP_StringVar** - This Var type shares _string_ data types. To set the value simply call _void COP_StringVar.set_value(string value)_. To get the value just call _string COP_StringVar.get_value()_. To use COP_StringVar simply change the type of a var to COP_StringVar.
- **COP_Vector2Var** - This Var type shares _Vector2_ data types. To set the value simply call _void COP_Vector2Var.set_value(Vector2 value)_. To get the value just call _Vector2 COP_Vector2Var.get_value()_. To use COP_Vector2Var simply change the type of a var to COP_Vector2Var.
- **COP_Vector3Var** - This Var type shares _Vector3_ data types. To set the value simply call _void COP_Vector3Var.set_value(Vector3 value)_. To get the value just call _Vector3 COP_Vector3Var.get_value()_. To use COP_Vector3Var simply change the type of a var to COP_Vector3Var.
- **COP_Var Template** - Fir creating a new COP_Var type you can simply use the script templates that are already present in the addon. Go to the folder _addons_ -> _kamran_wali_ -> _code_opt_pro_ and then copy the folder **script_templates**. Paste the copied folder to the root folder **res://**. Now you can use the script template to create a new COP_Var. Just create a new script and make sure to _Inherit_ from _Resource_. Then in the _Template_ section select **Resource: Var Template**. Give the script any name you want and finally create it. Now in the script make sure to give it a class name if you want to which has been commented out. For the value change it to any type you want. For the **get_value()** method make sure to give it a return type as well which may help with performance a bit. Finally for the **set_value(value)** give the parameter a type as well for helping with performance.

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

***
