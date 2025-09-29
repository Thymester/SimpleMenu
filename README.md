# SimpleMenu

[Visit the Wiki for MORE!](https://github.com/Thymester/SimpleMenu/wiki)

# NOTE

The code is a absolute mess. This was my first ever project and was extremely bad at coding.

# SimpleMenu Tutorial

![SimpleMenu](https://img.shields.io/badge/SimpleMenu-v2.0-brightgreen)
![FiveM](https://img.shields.io/badge/FiveM-Compatible-blue)
![License](https://img.shields.io/badge/License-Free-green)

> **Advanced FiveM Server Administration Menu**  
> Vehicle Spawning • Player Management • Permission System • Emergency Services

---

## 📋 Table of Contents

- [SimpleMenu](#simplemenu)
- [Emergency Services Vehicle List](#how-to-get-emergency-services-vehicle-list)
- [Installation Instructions](#install-instructions)
- [Changelog](#changelog)
- [Permissions Setup](#to-add-permissions-to-any-given-person-do-the-following)
- [Admin-Only Menu](#how-to-only-allow-admins-to-open-the-menu)
- [Emergency Services Cars](#how-to-add-emergency-services-cars)
- [Emergency Loadouts](#how-to-get-emergency-loadouts)
- [Addon Peds](#how-to-get-addon-peds)
- [ACE Permissions](#ace-permissions-are-added-to-the-following)
- [Custom Car & Ped Spawning](#how-to-enable-custom-car--ped-spawning)
- [Important Notes](#note)

---

## SimpleMenu

---

## How to get Emergency Services Vehicle List

1: Uncomment Lines 453 --> 458

---

## INSTALL INSTRUCTIONS:

1: Download the Menu from FiveM Forums: [SimpleMenu](https://forum.fivem.net/t/simplemenu-now-with-ace-permissions-now-fully-released-lua/324733)

2: Drag & Drop the two folders into resources

3: In order do the following

```cfg
start NativeUI
start SimpleMenu
```

4: Do not change the name of any of the folders to make it easier. server.cfg is case sensitive

*\* - If you wish you may use this in any private or public project!*

---

## Changelog

**Visit Releases at GitHub for Releases!**

---

## To add Permissions to any given person do the following.

\# SimpleMenu Group

```cfg
add_ace identifier.steam:[Steam HEX Here] simplemenu.admin allow --Name of Person Here
add_ace identifier.steam:[Steam HEX Here] simplemenu.state allow --Name of Person Here
add_ace identifier.steam:[Steam HEX Here] simplemenu.highway allow --Name of Person Here
add_ace identifier.steam:[Steam HEX Here] simplemenu.sheriff allow --Name of Person Here
add_ace identifier.steam:[Steam HEX Here] simplemenu.emt allow --Name of Person Here
add_ace identifier.steam:[Steam HEX Here] simplemenu.emergency allow --Name of Person Here
```

---

## How to ONLY allow Admins to Open the Menu

1: Go to line 1871

2: Uncomment lines 1871 –> 1881

*NOTE: To uncomment take out "–[[" and "]]"*

---

## How to add Emergency Services Cars

1: Go to lines 386 –> 406

2: When you go there add the Emergency Services spawn codes (On your server) to be able to spawn them in-game

3: Must reload script after changes

---

## How to get Emergency Loadouts

1: Go to 452 –> 457

2: Uncomment those lines by removing the two "–" before each 'submenu:AddItem()'

---

## How to get Addon Peds

1: Go to line 1681 and uncomment it

2: Go to line 1683 and uncomment it

3: Go to line 1689 and uncomment it which is commented from 1689 –> 1693 (Remove "–[[" and "]]")

---

## Ace Permissions are added to the following.

1: Healing

2: Armour Giving

3: Godmode

4: Invisibility

*NOTE: There may or may not be more added from updates.*

---

## How to enable Custom Car & Ped Spawning

**For Custom Car Spawns**

1: Uncomment lines 385 & 387 (To uncomment remove "–")

2: Uncomment lines 393 -> 397 (To uncomment remove "–[[" and "]]")

**For Custom Ped Spawns**

1: Uncomment lines 1286 & 1288 (To uncomment remove "–")

2: Uncomment lines 1294 -> 1298 (To uncomment remove "–[[" and "]]")

To add the Custom Peds and Custom Cars follow the templates located on lines 310 & 1234

---

## NOTE:

NativeUI is from Frazzle not myself, if you wish to download the files located on GitHub (SimpleMenu & NativeUI) it is NOT in a drag & drop format!

[NativeUI Download Link](https://github.com/FrazzIe/NativeUILua)

---

## 🔗 Links

- **Download:** [FiveM Forums](https://forum.fivem.net/t/simplemenu-now-with-ace-permissions-now-fully-released-lua/324733)
- **NativeUI:** [GitHub Repository](https://github.com/FrazzIe/NativeUILua)

---

## 📝 Permission Quick Reference

| Permission | Description |
|------------|-------------|
| `simplemenu.admin` | Full administrative access |
| `simplemenu.state` | State official permissions |
| `simplemenu.highway` | Highway patrol permissions |
| `simplemenu.sheriff` | Sheriff department permissions |
| `simplemenu.emt` | Emergency medical services |
| `simplemenu.emergency` | General emergency services |

---

## ⚠️ Important Reminders

- Always restart your script after making configuration changes
- Use Steam HEX identifiers for permanent permissions
- Maintain proper commenting syntax when uncommenting lines
- Ensure NativeUI is started before SimpleMenu in your server.cfg

---

*Made with ❤️ for the FiveM community*
