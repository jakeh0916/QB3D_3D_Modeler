# **QB3D Documentation** 5/5/22 - Version 0.9.0 (Stable)
 
## **About QB3D**
 
*QB3D* is a work-in-progress (this is not true, I'm not working on it anymore) 3D modeling software created by Jake Huseman.
 
This app is written with *QB64* (BASIC's weird cousin, updated to play nicely with 64-bit processors).
 
Due to self-imposed and QB64-related limitations, this app uses a 3D engine that was built from the ground-up. With the exception of a single function that interfaces with one's GPU to draw triangles, all logic, math, memory, resource, and input handling are computed on the CPU with hand-written code in what is essentially BASIC. Therefore, make no mistake: this app is not perfectly optimized nor bug-free.
 
---
## **Installation**
 
HOW TO INSTALL: *(Currently Windows 7-10 Only)*

1. Download the application as a zipped folder from GitHub.
2. Navigate to your downloads, right click on the zipped folder, and "Extract All..." to some destination.
3. Run "QB3D.exe."
 
DETAILS ABOUT THE PROJECT HIERARCHY:

- Within the main project folder, source code can be found in "src."
- Resources used by the app can be found in "resources."
- To create/add new Stage files, navigate to "resources/stages."
    - (More info about Stages below...)
 
---
## **Features**
 
STAGES:

- Stage-based rendering schema.
- Stages (.stg files) contain Objects and some metadata for the engine.
 
OBJECTS AND MESHES:

- Objects contain Meshes, and they provide a handy abstraction that allows for translation, rotation, scale, and movement of those loaded Meshes.
- A Mesh is a collection of triangles.
    - Technically, all triangles rendered by QB3D are stored contiguously in the TriangleHandler. An Object contains a pointer to a location in that reserved memory, and a size, which resolves to N-many triangles under its ownership.
- Objects can also contain custom Scripts. Scripts can manipulate the Object's parameters and can respond to input, events, or other Objects.
 
RENDERING:

- Currently, QB3D is capable of rendering 1 million triangles to the viewport. (Personally, I don't recommend doing that.)
- QB3D is capable of including and rendering Directional Light and Point Light Objects.
 
INPUT:

- QB3D makes use of a custom input API written in QB64. This is because low-level input buffers are a nightmare to deal with.
 
---
## **Update Log**
 
VERSION 0.9.0:

- Transitioned from console-based UI to window-based UI
- Debug menu simplified
- Optimization changes for objects and meshes
- Fix: Crash on running empty Stage files
- Fix: Crash on running nonexistent Stage files
- Fix: Draw order issue; GL rendering above software images
 
VERSION 0.8.1:

- Fix: Crash on various unexpected inputs
- Fix: Bug causing Windows to run program as fast as possible regardless of intended framerate
 
VERSION 0.8.0:

- Added Object scripting
- Added several demo Stages
- Added support for Point Lights
- Added various debugging tools
    - Debug Mesh Handler, Texture Handler, Object Handler, etc.
- Fix: Various rendering logic defects causing slow-down
 
---
## **Future Log**
 
PLANNED FEATURES FOR VERSION 0.9.1: *(Currently In Progress)*

- Fix: Various UI optimization issues
- Fix: Geometry texture stuttering at low frame-rates
- Toggle-able grid rendered to viewport
- Provide better documentation for code
 
PLANNED FEATURES FOR VERSION 1.0.0:

- Vertex editing (Mouse-based)
- Triangle face editing (Mouse-based)
- UI overhaul
- Transition to GPU-based UI to cut down on performance costs.
