<p align="center"><img src="https://imgur.com/vupUkm8.png"></p>

# CodeOptPro

### Introduction
This is a simple Godot system that helps with performance.

## Table of Contents:
- [Prerequisites](#prerequisites)
- [Stable Build](#stable-build)
- [Installation](#installation)
- [Features](#features)
- [Updates](#updates)
- [Bug Fixes](#bug-fixes)
- [Versioning](#versioning)
- [Authors](#authors)
- [License](#license)

## Prerequisites
#### Godot Game Engine
Godot version **v4.4.1.stable.mono.official [49a5bc7b6]** and above should work. Previous Godot version of **v4.3.stable.mono.official [77dcf97d8]**, **v4.1.3.stable.mono.official [f06b6836a]** and **v4.1.1.stable.mono.official [bd6af8e0e]** should work but any version before that have not been tested and may give errors.
***
## Stable Build
[Stable-v1.15.0](https://github.com/deadlykam/CodeOptPro_Godot/tree/Stable-v1.14.0) is the latest stable build of the project. The compressed file for this project can also be found there. If development is going to be done on this project then it is adviced to branch off of any _Stable_ branches because they will **NOT** be changed or updated except for README.md. Any other branches are subjected to change including the main branch.
***
## Installation
1. First download the latest [CodeOptPro-v1.15.0.zip](https://github.com/deadlykam/CodeOptPro_Godot/releases/tag/v1.15.0) from the latest Stable build.
2. Once downloaded extract/unzip the file.
3. Enter the folder and copy the folder named **kamran_wali**.
4. Now paste the folder in the **addons** folder of your Godot project. If your Godot project does not have the **addons** folder then just create it in the root folder, **res://**, and paste the copied folder there.
5. (Optional) To open the interface for CodeOptPro simply go to the menu _Project_ -> _Projct Settings_. Click the _Plugins_ tab and enable the **Variable Creator** or **Instantiate Object**. This should open and dock the **Variable Creator** or **Instantiate Object**.
7. (Optional) If you want access to the CodeOptPro's script templates then go to the folder _addons_ -> _kamran_wali_ -> _code_opt_pro_ and copy then copy the folder named **script_templates**. Paste the copied folder in the root folder, res://. Now the script_templates should be available while inherting from Resource.
***
## Features
I have added lot of features to **CodeOptPro** below is a list of feature added. *Also I have moved all the tutorials to [Wiki](https://github.com/deadlykam/CodeOptPro_Godot/wiki) because **ReadMe** was getting too big.*

- [Bar](https://github.com/deadlykam/CodeOptPro_Godot/wiki/Tutorial-Bar)
- [Debug](https://github.com/deadlykam/CodeOptPro_Godot/wiki/Tutorial-Debug)
- [Instantiate Object](https://github.com/deadlykam/CodeOptPro_Godot/wiki/Tutorial-Instantiate-Object)
- [Pool](https://github.com/deadlykam/CodeOptPro_Godot/wiki/Tutorial-Pool)
- [Timer](https://github.com/deadlykam/CodeOptPro_Godot/wiki/Tutorial-Timer)
- [Update Manager](https://github.com/deadlykam/CodeOptPro_Godot/wiki/Tutorial-Update-Manager)
- [Variable Creator](https://github.com/deadlykam/CodeOptPro_Godot/wiki/Tutorial-Variable-Creator)
- [Vector Performant Calculation](https://github.com/deadlykam/CodeOptPro_Godot/wiki/Vec)

## Updates
Here I will share all the updates done to the current versions. Below are the updates.
1. Added a flag variable in the Update Manager called [_is_enable_start](https://github.com/deadlykam/CodeOptPro_Godot/wiki/base_update_manager#cop_fixedboolvar-_is_enable_start). Now it is possible to enable/disable the Update Manager at the start up. If disabled then the only way to enable the Update Manager is through script by calling the method [set_enabled(bool)](https://github.com/deadlykam/CodeOptPro_Godot/wiki/base_update_manager#void-set_enabled--bool-is_enable-). More info is available in the [Wiki page](https://github.com/deadlykam/CodeOptPro_Godot/wiki/base_update_manager#cop_fixedboolvar-_is_enable_start).
2. Updated the Godot version to v4.4.1.stable.mono.official [49a5bc7b6]. This will make sure that CodeOptPro is working with the latest Godot version. Also if you are coming from Godot 4.3 with an older CodeOptPro version then make sure to delete the file **addons/kamran_wali/code_opt_pro/variables/default_settings/paths_fixed_var.tres** file. This is to make sure the that there are no UID duplicate warnings given by Godot. If you do NOT have the file then you are good to go.
***
## Bug Fixes:
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
