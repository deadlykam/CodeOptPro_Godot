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

#### Vector Performant Calculation:
